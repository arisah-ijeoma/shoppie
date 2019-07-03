require 'rails_helper'

describe Category, type: :model do
  let(:category) { cat }

  context 'creation' do
    describe 'valid params' do
      let(:cat) { build(:category) }

      it 'saves' do
        expect { category.save! }.to change { Category.count }.by(1)
      end
    end

    describe 'invalid params' do
      let(:cat) { build(:category, name: '') }

      it 'does not save' do
        expect { category.save! }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
        )
      end
    end
  end

  context 'editing' do
    let(:cat) { create(:category, name: 'Originals') }

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
    let!(:cat) { create(:category) }

    it 'deletes' do
      expect { category.destroy }.to change { Category.count }.by(-1)
    end
  end
end
