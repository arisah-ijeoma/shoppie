FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    address { Faker::Address.full_address }
  end
end
