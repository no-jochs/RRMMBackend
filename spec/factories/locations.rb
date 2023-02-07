FactoryBot.define do
  factory :location do
    name { Faker::Company.name }
    notes { Faker::Lorem.sentences.join(' ') }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    street_address_1 { Faker::Address.street_address }
    street_address_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state_providence { Faker::Address.state_abbr }
    country { Faker::Address.country_code }
    postal_code { Faker::Address.postcode }
    slug { Faker::Internet.slug }
    venue_type { %i[in_person online hybrid].sample }
    status { :approved }
    timezone_identifier { Faker::Address.time_zone }
  end
end
