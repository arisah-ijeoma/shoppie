require 'rails_helper'

describe OrderItem, type: :model do
  let(:order) { create(:order) }
  let(:product) { create(:product, price: 10) }
  let(:product_2) { create(:product, price: 5) }
  let!(:order_item) { create(:order_item, quantity: 5, product: product, order: order) }
  let!(:order_item_2) { create(:order_item, quantity: 3, product: product_2, order: order) }

  describe '#total' do
    it 'returns the correct total' do
      expect(order.total).to eq(65)
    end
  end
end
