# frozen_string_literal: true

require 'rails_helper'

describe 'orders', type: :feature do
  let!(:user) { create(:user) }

  scenario 'empty basket shows empty order page' do
    login user
    find('.fa-shopping-basket').click

    expect(page).to have_content('Your basket is empty')
    expect(page).to have_link('Start shopping', href: root_path)
  end
end
