FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Alphanumeric.alphanumeric(number: 10)}
    api_key { Faker::Alphanumeric.alphanumeric(number: 5)}
  end

end
