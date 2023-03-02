FactoryBot.define do
  factory :physical_venue, parent: :venue do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    street_address_1 { Faker::Address.street_address }
    street_address_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state_providence { Faker::Address.state_abbr }
    country { Faker::Address.country_code }
    postal_code { Faker::Address.postcode }
    time_zone { Faker::Address.time_zone }
    type { 'PhysicalVenue' }
  end
end
