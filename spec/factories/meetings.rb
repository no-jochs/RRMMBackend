FactoryBot.define do
  factory :meeting do
    name { 'Example Meeting' }
    start_time { Time.zone.now }
    duration { 60 * 60 }
    day { 'thursday' }
    timezone { 'Los Angeles' }
    notes { '' }
    conference_link { 'https://zoom.link.com' }
    group_resources { {} }
    url_slug { 'example-meeting' }
    language { 'english' }
    location
  end
end
