FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
