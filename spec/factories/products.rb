FactoryBot.define do
  factory :product do
    name { Faker::DcComics.name }
    description { Faker::Lorem.sentence(10) }
    price { Faker::Commerce.price(range = 0..10.0, as_string = true) }
    status { %w[active inactive].sample }
    availability_date { Faker::Date.forward(23) }
    association(:category)
  end
end
