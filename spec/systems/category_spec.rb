# frozen_string_literal: true

require 'rails_helper'

describe 'category page', type: :system, js: true do
  # Categories
  let(:parent_category_1) { create(:category, name: 'Food') }
  let(:parent_category_2) { create(:category, name: 'Games', visible: false) }
  let(:sub_category_1) { create(:category, name: 'Colors', category: parent_category_1 ) }

  # Products
  let!(:visible_parent_product) { create(:product, name: 'Afang', category: parent_category_1) }
  let!(:hidden_parent_product) { create(:product, name: 'MK11', category: parent_category_2) }
  let!(:visible_child_product) { create(:product, name: 'Green', category: sub_category_1) }

  before do
    visit category_path(parent_category_1)
    select 'Colors', from: 'category'
  end

  scenario 'filtering works' do
    expect(page).to have_content('Green')
    expect(page).not_to have_content('Afang')
  end

  scenario 'selecting blank option resets filter' do
    select 'Sub Categories', from: 'category'

    expect(page).to have_content('Green')
    expect(page).to have_content('Afang')
  end

  scenario 'clear filter link shows on click of sub category' do
    expect(page).to have_content('Clear filter')
  end

  scenario 'selecting blank option does not show clear filter link' do
    select 'Sub Categories', from: 'category'

    expect(page).not_to have_content('Clear filter')
  end

  scenario 'clear filter resets product list' do
    click_on 'Clear filter'

    expect(page).to have_content('Green')
    expect(page).to have_content('Afang')
  end
end
