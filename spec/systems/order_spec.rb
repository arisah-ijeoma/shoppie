require 'rails_helper'

describe 'orders', type: :system, js: true do
  let!(:user) { create(:user) }
  let!(:product) { create(:product, name: 'Cranberry', price: '54.90') }

  scenario 'basket is updated when user adds to it' do
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    # first item
    click_on 'Cranberry'
    click_on 'Add to Basket'
    expect(page).to have_selector('#order_count', visible: false, text: '1')

    # adding item twice increments count
    click_on 'Add to Basket'
    expect(page).not_to have_selector('#order_count', visible: false, text: '1')
    expect(page).to have_selector('#order_count', visible: false, text: '2')
  end
end
