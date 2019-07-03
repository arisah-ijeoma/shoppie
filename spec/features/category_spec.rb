# frozen_string_literal: true

require 'rails_helper'

describe 'category page', type: :feature do
  # Categories
  let(:parent_category_1) { create(:category, name: 'Food') }
  let(:parent_category_2) { create(:category, name: 'Games', visible: false) }
  let!(:sub_category_2) { create(:category, name: 'Fantasy', category: parent_category_2) }
  let(:child_category_1_1) { create(:category, name: 'Colors', category: parent_category_1 ) }

  # Products
  let!(:visible_parent_product) { create(:product, name: 'Afang', category: parent_category_1) }
  let!(:hidden_parent_product) { create(:product, name: 'MK11', category: parent_category_2) }
  let!(:visible_child_product) { create(:product, name: 'Green', category: child_category_1_1) }

  scenario 'products belonging to clicked parent category shows' do
    visit root_path
    click_on 'Games'
    expect(page).to have_content('MK11')
    expect(page).not_to have_content('Afang')
    expect(page).not_to have_content('Green')
  end

  scenario 'select box has correct options' do
    visit root_path
    click_on 'Games'

    within('select') do
      %w[Fantasy].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
  end
end
