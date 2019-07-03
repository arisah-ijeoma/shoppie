require 'rails_helper'

describe Product, type: :model do
  let(:product) { pdt }

  context 'creation' do
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

  context 'editing' do
    let(:pdt) { create(:product, name: 'Cable') }

    describe 'valid params' do
      it 'updates correctly' do
        product.name = 'Thanos'
        product.save!
        expect(product.name).to eq('Thanos')
      end
    end

    describe 'invalid params' do
      it 'updates correctly' do
        product.name = ''
        expect { product.save! }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
        )
      end
    end
  end

  context 'deletion' do
    let!(:pdt) { create(:product) }

    it 'deletes' do
      expect { product.destroy }.to change { Product.count }.by(-1)
    end
  end
end
