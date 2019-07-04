FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
