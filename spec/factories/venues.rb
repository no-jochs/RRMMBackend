FactoryBot.define do
  factory :venue do
    name { Faker::Company.name }
    notes { Faker::Lorem.sentences.join(' ') }
    slug { Faker::Internet.slug }
    status { %i[approved requires_review requires_changes rejected].sample }
  end

  factory :virtual_venue, parent: :venue do
    name { VirtualVenue::NAME_VALUE }
    slug { VirtualVenue::SLUG_VALUE }
    type { 'VirtualVenue' }
  end
end
