require 'rails_helper'

describe Category, type: :model do
  let(:category) { category }

  describe 'basic actions' do
    context 'creation' do
      describe 'valid params' do
        let(:category) { build(:category) }

        it 'saves' do
          expect { category.save! }.to change { Category.count }.by(1)
        end
      end

      describe 'invalid params' do
        let(:category) { build(:category, name: '') }

        it 'does not save' do
          expect { category.save! }.to raise_error(
            ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
          )
        end
      end
    end

    context 'editing' do
      let(:category) { create(:category, name: 'Originals') }

      describe 'valid params' do
        it 'updates correctly' do
          category.name = 'Photocopy'
          category.save!
          expect(category.name).to eq('Photocopy')
        end
      end

      describe 'invalid params' do
        it 'updates correctly' do
          category.name = ''
          expect { category.save! }.to raise_error(
            ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
          )
        end
      end
    end

    context 'deletion' do
      let!(:category) { create(:category) }

      it 'deletes' do
        expect { category.destroy }.to change { Category.count }.by(-1)
      end
    end
  end

  describe '.visible_products' do
    let(:visible_category) { create(:category) }
    let(:hidden_category) { create(:category, visible: false) }

    let!(:visible_product) { create(:product, category: visible_category) }
    let!(:hidden_product) { create(:product, category: hidden_category) }

    it 'returns only products that have visible categories' do
      expect(Category.visible_products).to eq([visible_product])
    end
  end
end
