FactoryBot.define do
  factory :order_item do
    quantity { Faker::Number.between(1, 10) }
    association(:order)
    association(:product)
  end
end
