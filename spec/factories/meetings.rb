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
    status { %i[approved requires_review requires_changes rejected].sample }
    venue { build(:physical_venue) }
  end
end
