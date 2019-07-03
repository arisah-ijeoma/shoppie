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
      describe 'no price' do
        let(:pdt) { build(:product, price: nil) }

        it 'does not save' do
          expect { product.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
        end
      end

      describe 'empty price' do
        let(:pdt) { build(:product, price: '') }

        it 'does not save' do
          expect { product.save! }.to raise_error(
            ActiveRecord::RecordInvalid, "Validation failed: Price can't be blank"
          )
        end
      end
    end

  end
end
