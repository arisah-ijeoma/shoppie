# frozen_string_literal: true

require 'rails_helper'

describe 'category page', type: :feature do
  # Categories
  let(:parent_category_1) { create(:category, name: 'Food') }
  let(:parent_category_2) { create(:category, name: 'Games', visible: false) }
  let(:sub_category_1) { create(:category, name: 'Colors', category: parent_category_1 ) }

  # Products
  let!(:visible_parent_product) { create(:product, name: 'Afang', category: parent_category_1) }
  let!(:hidden_parent_product) { create(:product, name: 'MK11', category: parent_category_2) }
  let!(:visible_child_product) { create(:product, name: 'Green', category: sub_category_1) }

  scenario 'products belonging to clicked parent category shows without child' do
    visit root_path
    click_on 'Games'
    expect(page).to have_content('MK11')
    expect(page).not_to have_content('Afang')
    expect(page).not_to have_content('Green')
  end

  scenario 'products belonging to clicked parent category shows with child' do
    visit root_path
    click_on 'Food'
    expect(page).not_to have_content('MK11')
    expect(page).to have_content('Afang')
    expect(page).to have_content('Green')
  end

  scenario 'select box has correct options when sub categories are available' do
    visit root_path
    click_on 'Food'

    within('select') do
      %w[Colors].each do |option|
        expect(find("option[value=#{sub_category_1.id}]").text).to eq(option)
      end
    end
  end

  scenario 'select box does not show when there are no sub categories' do
    visit root_path
    click_on 'Games'

    expect(page).not_to have_selector('select')
  end
end
