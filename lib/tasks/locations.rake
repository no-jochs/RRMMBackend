require 'nokogiri'
require 'open-uri'

namespace :locations do
  desc 'Scrape the location data from the existing website.'
  task scrape: :environment do
    locations_url = 'https://refugerecoverymeetings.org/locations'
    doc = Nokogiri::HTML(URI.open(locations_url))
    pages = doc.css('a.page-numbers')[1].text.to_i
    current_page = 1

    location_links = []

    while current_page <= pages
      ldoc = Nokogiri::HTML(URI.open(locations_url + "/page/#{current_page}"))
      location_links += ldoc.css('h2.entry-title a').pluck('href')
      current_page += 1
    end

    puts "Found #{location_links.size} links to process."

    location_links.each do |ll|
      slug = ll.match(%r{locations/(?<location_slug>.+)})['location_slug']
      next if slug == '%d1%84%d0%be%d0%bd%d0%b4-%d1%84%d0%b0%d1%80'
      next if slug == 'the-calm-sober-house'
      next if slug == 'the-calm-sober-house-2'
      next if slug == 'woodward-park'
      next if slug == 'online-2'
      next if slug == '33409'
      next if slug == 'tokyo'
      next if slug == 'online-us'
      next if Location.find_by_slug(slug)

      l = Location.new
      l.slug = slug
      locdoc = Nokogiri::HTML(URI.open(ll))
      l.name = locdoc.at_css('h1').text

      address = locdoc.css('li.list-group-item-address p').children.map { |e| e.text }
      puts address.join(', ')

      resp = JSON.parse(
        Net::HTTP.post(
          URI("https://addressvalidation.googleapis.com/v1:validateAddress?key=#{ENV.fetch('GOOGLE_MAPS_API_KEY')}"),
          { address: { addressLines: address } }.to_json,
          { 'Content-Type': 'application/json' }
        ).body
      )

      next if Location.find_by_place_id(resp['result']['geocode']['placeId'])

      components = resp['result']['address']['addressComponents']
      street_number = components.find { |c| c['componentType'] == 'street_number' }['componentName']['text']
      route = components.find { |c| c['componentType'] == 'route' }['componentName']['text']
      locality = components.find { |c| c['componentType'] == 'locality' }['componentName']['text']
      aal1 = components.find { |c| c['componentType'] == 'administrative_area_level_1' }['componentName']['text']
      postcode = components.find { |c| c['componentType'] == 'postal_code' }['componentName']['text']
      puts "Country: #{country}, Link: #{ll}"
      pcsuf = components.find { |c| c['componentType'] == 'postal_code_suffix' }
      postcode += '-' + pcsuf['componentName']['text'] if pcsuf
      place_id = resp['result']['geocode']['placeId']
      country = if resp['result']['uspsData']
                  'US'
                else
                  components.find { |c| c['componentType'] == 'country' }['componentName']['text']
                end

      begin
        l.street_address_1 = "#{street_number} #{route}"
        l.city = locality
        l.state_providence = aal1
        l.country = (ISO3166::Country[country] || ISO3166::Country.find_country_by_any_name(country))&.alpha2 || 'US'
        l.postal_code = postcode
        l.latitude = resp['result']['geocode']['location']['latitude']
        l.longitude = resp['result']['geocode']['location']['longitude']
        l.place_id = place_id
        tz_lookup = JSON.parse(
          Net::HTTP.get(
            URI("https://maps.googleapis.com/maps/api/timezone/json?location=#{l.latitude}%2C#{l.longitude}&timestamp=#{Time.now.to_i}&key=#{ENV.fetch('GOOGLE_MAPS_API_KEY')}")
          )
        )
        l.time_zone = tz_lookup['timeZoneId']

        l.save
      rescue StandardError => e
        puts "Error saving location: #{l}"
        puts e
      end
    end
  end
end
