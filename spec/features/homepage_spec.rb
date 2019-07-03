# frozen_string_literal: true

require 'rails_helper'

describe 'home page', type: :feature do
  let!(:category) { create(:category, name: 'Food') }
  let!(:category) { create(:category, name: 'Games', visible: false) }

  scenario 'visible and invisible categories are seen' do
    visit root_path
    expect(page).to have_content('Food')
    expect(page).to have_content('Games')
  end
end
