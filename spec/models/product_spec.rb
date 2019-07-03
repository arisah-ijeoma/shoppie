require 'rails_helper'

describe Product, type: :model do
  context 'creation' do
    let(:product) { pdt }

    describe 'valid params' do
      let(:pdt) { build(:product) }

      it 'saves' do
        expect { product.save! }.to change { Product.count }.by(1)
      end
    end

    describe 'invalid params' do
      let(:pdt) { build(:product, :invalid) }

      it 'does not save' do
        expect { product.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
      end
    end
  end
end
