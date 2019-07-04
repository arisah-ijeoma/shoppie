# frozen_string_literal: true

require 'rails_helper'

describe 'product', type: :feature do
  let!(:product) { create(:product, name: 'Cranberry', price: '14.90') }

  scenario 'clicking on product shows product details' do
    visit root_path
    click_on 'Cranberry'

    expect(page).to have_content('Cranberry')
    expect(page).to have_content('14.90')
    expect(page).to have_content('Add to Basket')
  end

  scenario 'product can not be added to basket until user signs in' do
    visit root_path
    click_on 'Cranberry'
    click_on 'Add to Basket'

    expect(current_path).to eq('/users/sign_in')
    expect(page).to have_content('Log in')
  end
end
