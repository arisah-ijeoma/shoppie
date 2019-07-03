FactoryBot.define do
  factory :category, class: 'Category' do
    name { Faker::Company.name }
    visible { true }
    status { %w[active inactive].sample }
    association(:admin_user)
  end
end
