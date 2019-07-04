admin_user = AdminUser.find_or_create_by!(email: 'admin@example.com') do |a|
  a.password = 'password'
  a.password_confirmation = 'password'
end

category = Category.find_or_create_by!(name: 'Sample Category') do |c|
  c.admin_user = admin_user
end

category_1 = Category.create(name: 'first_sub', category: category, admin_user: admin_user)
category_2 = Category.create(name: 'second_sub', category: category, visible: false, admin_user: admin_user)
puts 'categories', [category_1, category_2]
category_3 = Category.new
category_3.name = 'third_sub'
category_3.category = category
category_3.admin_user = admin_user
  if category_3.save
    puts 'created'
  else
    puts category_3.errors
  end

Product.create(name: 'product1', category: category)
Product.create(name: 'product2', category: category_1)
Product.create(name: 'product3', category: category_2)
Product.create(name: 'product4', category: category_3)
