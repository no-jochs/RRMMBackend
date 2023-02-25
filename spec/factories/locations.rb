FactoryBot.define do
  factory :location do
    notes { Faker::Lorem.sentences.join(' ') }
    slug { Faker::Internet.slug }
    status { :approved }
  end

  factory :physical_location, parent: :location do
    name { Faker::Company.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    street_address_1 { Faker::Address.street_address }
    street_address_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state_providence { Faker::Address.state_abbr }
    country { Faker::Address.country_code }
    postal_code { Faker::Address.postcode }
    time_zone { Faker::Address.time_zone }
    location_type { 'PhysicalLocation' }
  end

  factory :virtual_location, parent: :location do
    name { 'Online' }
    location_type { 'VirtualLocation' }
  end
end
