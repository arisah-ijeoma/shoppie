# frozen_string_literal: true

require 'rails_helper'

describe 'orders', type: :feature do
  let(:user) { create(:user) }
  let(:nameless_user) { create(:user, name: '') }
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
      expect(OrderItem.last.reload.status).to eq('Address')
    end
  end

  describe 'unnamed user' do
    let(:order) { create(:order, user: nameless_user) }
    let!(:order_item) { create(:order_item, order: order, product: product) }

    scenario 'order can not be placed without adding name and address' do
      login nameless_user
      click_on 'Basket'
      click_on 'Next'

      click_on 'Place order'
      expect(page).to have_content("can't be blank")
    end

    scenario 'order is placed when name and address are added' do
      login nameless_user
      click_on 'Basket'
      click_on 'Next'

      fill_in 'Name', with: 'Jayita'
      click_on 'Place order'

      expect(OrderItem.last.reload.status).to eq('Complete')
      expect(page).to have_content('Order successfully placed')
      expect(page).to have_selector('#order_count', visible: false, text: '1')
    end
  end
end
