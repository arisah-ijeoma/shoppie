FactoryBot.define do
  factory :category, class: 'Category' do
    name { Faker::Company.name }
    visible { true }
    status { %w[active inactive].sample }

    trait :invalid do
      name { '' }
    end
  end
end
