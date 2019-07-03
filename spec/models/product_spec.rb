require 'rails_helper'

describe Product, type: :model do
  context 'creation' do
    describe 'valid params' do
      let(:product) { build(:product) }

      it 'saves' do
        expect { product.save! }.to change { Product.count }.by(1)
      end
    end
  end
end
