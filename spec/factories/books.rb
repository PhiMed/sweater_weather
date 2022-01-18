FactoryBot.define do
  factory :book do
    isbn { Faker::Alphanumeric.alphanumeric(number: 10)}
    title { Faker::Alphanumeric.alphanumeric(number: 5)}
    publisher { Faker::Alphanumeric.alphanumeric(number: 3)}
  end

end
