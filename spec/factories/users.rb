FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.urlsafe_base64 }
    authorizations { {} }
  end
end
