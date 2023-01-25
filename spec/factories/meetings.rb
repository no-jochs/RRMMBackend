FactoryBot.define do
  factory :meeting do
    name { "#{Faker::Company.name} Meeting" }
    start_date { Date.today }
    start_time { Time.zone.now }
    duration { 60 }
    day { Meeting.days.keys.sample.to_sym }
    timezone { Faker::Address.time_zone }
    notes { Faker::Lorem.sentences.join(' ') }
    conference_link { 'https://zoom.link.com' }
    group_resources { {} }
    url_slug { Faker::Internet.slug }
    language { Meeting.languages.keys.sample.to_sym }
    location
  end
end
