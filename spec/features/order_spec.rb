# frozen_string_literal: true

require 'rails_helper'

describe 'orders', type: :feature do
  let!(:user) { create(:user) }
  let!(:product) { create(:product, name: 'Cranberry', price: '14.90') }

  scenario 'empty basket shows empty order page' do
    login user
    click_on 'Basket'

    expect(page).to have_content('Your basket is empty')
    expect(page).to have_link('Start shopping', href: root_path)
  end
end
