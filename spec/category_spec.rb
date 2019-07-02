require 'rails_helper'

describe Category, type: :model do
  context 'creation' do
    describe 'valid params' do
      let(:category) { build(:category) }

      it 'saves' do
        expect { category.save! }.to change { Category.count }.by(1)
      end
    end
  end
end
