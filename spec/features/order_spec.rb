# frozen_string_literal: true

require 'rails_helper'

describe 'orders', type: :feature do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:product) { create(:product, name: 'Cranberry', price: '14.90') }

  scenario 'empty basket shows empty order page' do
    login user
    click_on 'Basket'

    expect(page).to have_content('Your basket is empty')
    expect(page).to have_link('Start shopping', href: root_path)
  end

  describe 'with items' do
    let!(:order_item) { create(:order_item, order: order, product: product) }

    scenario 'order delivery page' do
      login user
      click_on 'Basket'
      click_on 'Next'

      expect(page).to have_selector(:link_or_button, 'Place order')
      expect(page).to have_content('Edit basket')
      expect(OrderItem.last.status).to eq('Address')
    end
  end
end
