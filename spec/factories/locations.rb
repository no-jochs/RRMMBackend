FactoryBot.define do
  factory :location do
    name { Faker::Company.name }
    notes { Faker::Lorem.sentences.join(' ') }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    formatted_address { Faker::Address.full_address }
    country { Faker::Address.country_code }
    state_providence { Faker::Address.state_abbr }
    postal_code { Faker::Address.postcode }
    url_slug { Faker::Internet.slug }
    venue_type { %i[in_person online hybrid].sample }
    status { :approved }
    timezone { Faker::Address.time_zone }
  end
end
