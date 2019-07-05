# frozen_string_literal: true

require 'rails_helper'

describe 'user', type: :feature do
  let!(:user) { create(:user) }

  scenario 'logout button shows when user is signed in' do
    login user
    expect(page).to have_content('Log out')
  end

  scenario 'login page does not have navbar' do
    visit '/users/sign_in'

    expect(page).not_to have_selector('nav')
  end

  scenario 'logout button does not show when user is not signed in' do
    login user
    click_on 'Log out'

    visit root_path

    expect(page).to have_content('Log in')
    expect(page).not_to have_content('Log out')
  end
end
