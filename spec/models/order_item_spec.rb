require 'rails_helper'

describe OrderItem, type: :model do
  let(:order) { create(:order) }
  let(:product) { create(:product, price: 10) }
  let(:order_item) { create(:order_item, quantity: 5, product: product, order: order) }

  describe '#sub_total' do
    it 'returns the correct subtotal' do
      expect(order_item.sub_total).to eq(50)
    end
  end
end
