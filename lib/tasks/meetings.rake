require 'nokogiri'
require 'open-uri'

def extract_hours_and_minutes(time_string)
  return [12, 0] if time_string.match(/noon/i)

  match = time_string.match(/(\d+):(\d+)\s+(am|pm)/)
  hrs = match[3].match?(/pm/i) ? match[1] + 12 : match[1]
  [hrs, match[2].to_i]
end

def find_start_date_and_duration(md)
  st_hr, st_min = extract_hours_and_minutes(mt_md['start'])
  end_hr, end_min = extract_hours_and_minutes(mt_md['end'])
  start_date = Time.new(2023, 1, 1, st_hr, st_min)
  end_date = Time.new(2023, 1, 1, end_hr, end_min)
  duration = end_date - start_date

  start_date += 1.day while start_date.wday != Time::DAYS_INTO_WEEK[md['day'].downcase.to_sym]

  [start_date, duration]
end

refuge_recovery_url = 'https://refugerecoverymeetings.org/meetings?tsml-day=any'

namespace :meetings do
  desc 'Scrape the meeting data from the existing website.'
  task scrape: :environment do
    doc = Nokogiri::HTML(URI.open(refuge_recovery_url))

    mtg_links = doc.css('td.name a').map { |n| n.attributes.fetch('href').value }

    mtg_links.each do |ml|
      mtg = Meeting.new
      mdoc = Nokogiri::HTML(URI.open(ml))
      mtg.name = mdoc.at_css('h1').text.strip
      mtg.slug = ml.match(%r{meetings/(?<slug>[^?]+)\?})['slug']

      mt_md = mdoc.at_css('p.meeting-time').text.strip.match(/^(?<day>\w+),\s+(?<start>\d{1,2}:\d{2}\s+[ap]m|Noon)\s+to\s+(?<end>\d{1,2}:\d{2}\s+[ap]m|Noon)/)
      start_date, duration = find_start_date_and_duration(mt_md)

      mtg.start_date = start_date
      mtg.duration = duration
    end
  end
end
