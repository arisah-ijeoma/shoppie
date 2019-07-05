require 'rails_helper'

describe 'orders', type: :system, js: true do
  let!(:user) { create(:user) }
  let!(:product) { create(:product, name: 'Cranberry', price: '54.90') }
  let!(:product_2) { create(:product, name: 'Television', price: '34.10') }

  scenario 'basket is updated when user adds to it' do
    login user

    # first item
    click_on 'Cranberry'
    click_on 'Add to Basket'
    expect(page).to have_selector('#order_count', visible: false, text: '1')
    expect(page).to have_content('Item has been added to basket')

    # adding item twice increments count
    click_on 'Add to Basket'
    expect(page).not_to have_selector('#order_count', visible: false, text: '1')
    expect(page).to have_selector('#order_count', visible: false, text: '2')
    expect(page).to have_content('Item has been added to basket')

    # adding another product updates the count
    visit category_product_path(product_2.category, product_2)
    click_on 'Add to Basket'
    expect(page).not_to have_selector('#order_count', visible: false, text: '2')
    expect(page).to have_selector('#order_count', visible: false, text: '3')
    expect(page).to have_content('Item has been added to basket')
  end

  scenario 'user can not order without being signed in' do
    visit root_path
    click_on 'Cranberry'
    click_on 'Add to Basket'

    expect(page).to have_content('Remember me')
  end
end
