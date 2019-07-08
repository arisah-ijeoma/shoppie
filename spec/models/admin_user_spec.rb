require 'rails_helper'

describe AdminUser, type: :model do
  let(:admin_user) { create(:admin_user) }
  let(:order_item) { create(:order_item) }

  context 'mail' do
    describe '#order_notification' do
      it 'should send mail to admin when one of his orders is completed' do
        order_item.update(status: 'Complete')
        expect { admin_user.order_notification }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
