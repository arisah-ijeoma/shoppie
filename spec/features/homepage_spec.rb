# frozen_string_literal: true

require 'rails_helper'

describe 'home page', type: :feature do
  let!(:parent_category_1) { create(:category, name: 'Food') }
  let!(:parent_category_2) { create(:category, name: 'Games', visible: false) }
  let!(:child_category_11) { create(:category, name: 'Colors', category: parent_category_1 ) }

  scenario 'visible and invisible parent categories are seen' do
    visit root_path
    expect(page).to have_content('Food')
    expect(page).to have_content('Games')
    expect(page).not_to have_content('Colors')
  end
end
