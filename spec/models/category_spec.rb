require 'rails_helper'

describe Category, type: :model do
  let(:category) { category }

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
