FactoryBot.define do
  factory :meeting do
    name { "#{Faker::Company.name} Meeting" }
    start_date { Date.today }
    start_time_hour { rand(24) }
    start_time_minute { rand(60) }
    duration { 60 }
    day { Meeting.days.keys.sample.to_sym }
    notes { Faker::Lorem.sentences.join(' ') }
    conference_link { 'https://zoom.link.com' }
    group_resources { {} }
    url_slug { Faker::Internet.slug }
    language { Meeting.languages.keys.sample.to_sym }
    status { :approved }
    location
  end
end
