FactoryBot.define do
  factory :meeting do
    name { "#{Faker::Company.name} Meeting" }
    start_date { Time.current - rand(10 * 365 * 24 * 60 * 60) }
    duration { [60, 75, 90].sample }
    notes { Faker::Lorem.sentences.join(' ') }
    conference_link { 'https://zoom.link.com' }
    group_resources { {} }
    slug { Faker::Internet.slug }
    language { Meeting.languages.keys.sample.to_sym }
    status { :approved }
  end

  factory :in_person_meeting, parent: :meeting do
    format { :in_person }
    location { create(:physical_location) }
  end

  factory :hybrid_meeting, parent: :meeting do
    format { :hybrid }
    location { create(:physical_location) }
  end

  factory :virtual_meeting, parent: :meeting do
    location { VirtualLocation.record || create(:virtual_location) }
    time_zone { Faker::Address.time_zone }
    format { :virtual }
  end
end
