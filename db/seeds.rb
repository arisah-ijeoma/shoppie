admin_user = AdminUser.find_or_create_by!(email: 'admin@example.com') do |a|
  a.password = 'password'
  a.password_confirmation = 'password'
end

category = Category.find_or_create_by!(name: 'Sample Category') do |c|
  c.admin_user = admin_user
end

category_1 = Category.find_or_create_by!(name: 'first_sub') do |sc|
  sc.category = category
  sc.admin_user = admin_user
end
category_2 = Category.find_or_create_by!(name: 'second_sub') do |sc|
  sc.category = category
  sc.visible = false
  sc.admin_user = admin_user
end
category_3 = Category.find_or_create_by!(name: 'third_sub') do |sc|
  sc.category = category
  sc.admin_user = admin_user
end

Product.create(name: 'product1', category: category, price: '12.34')
Product.create(name: 'product2', category: category_1, price: '25')
Product.create(name: 'product3', category: category_2, price: '1.40')
Product.create(name: 'product4', category: category_3, price: '17.54')
