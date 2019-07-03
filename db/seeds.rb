AdminUser.find_or_create_by!(email: 'admin@example.com') do |a|
  a.password = 'password'
  a.password_confirmation = 'password'
end

category = Category.find_or_create_by!(name: 'Sample Category')

Category.create(name: 'first_sub', category: category)
Category.create(name: 'second_sub', category: category)
Category.create(name: 'third_sub', category: category)
