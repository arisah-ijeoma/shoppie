# frozen_string_literal: true

require 'rails_helper'

describe 'user', type: :feature do
  let!(:user) { create(:user) }

  scenario 'logout button shows when user is signed in' do
    visit '/users/sign_in'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_on 'Log in'
    expect(page).to have_content('Log out')
  end
end
