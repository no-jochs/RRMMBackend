require 'nokogiri'
require 'open-uri'

refuge_recovery_url = 'https://refugerecoverymeetings.org/meetings?tsml-day=any'

namespace :meetings do
  desc 'Scrape the meeting and location records from the existing website.'
  task scrape: :environment do
    raise NotImplementedError, 'This task is not yet implemented.'
    home = Nokogiri::HTML(URI.open(refuge_recovery_url))

    meeting_links = home.css('tbody tr td.name a').map do |e|
      e.attributes.fetch('href').value.sub(/\?.*/, '')
    end

    meeting_links.each do |ml|
      @mtg = Meeting.new
      uri = URI.parse(ml)
      @doc = Nokogiri::HTML(URI.open(uri))
      @mtg.slug = uri.path.sub('/meetings/', '')
      @mtg.name = @doc.at_css('h1').text.strip
    end
  end
end
