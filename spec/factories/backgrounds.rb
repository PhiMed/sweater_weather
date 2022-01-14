FactoryBot.define do
  factory :background do
    location { Faker::Address.city }
    img_url { Faker::Internet.url }
    source { Faker::Company.name }
    author { Faker::Artist.name }
  end
end
