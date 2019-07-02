require 'rails_helper'

describe Category, type: :model do
  context 'creation' do
    describe 'valid params' do
      let(:category) { build(:category) }

      it 'saves' do
        expect { category.save! }.to change { Category.count }.by(1)
      end
    end

    describe 'invalid params' do
      let(:category) { build(:category, :invalid) }

      it 'does not save' do
        expect { category.save! }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
        )
      end
    end
  end
end