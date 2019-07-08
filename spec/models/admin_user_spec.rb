require 'rails_helper'

describe AdminUser, type: :model do
  let(:admin_user) { create(:admin_user) }
  let(:order_item_1) { create(:order_item) }
  let(:order_item_2) { create(:order_item) }

  context 'mail' do
    describe '#order_notification' do
      it 'should send mail to admin when one of his orders is completed' do
        order_item_1.update(status: 'Complete')
        order_item_2.update(status: 'Complete')
        expect { admin_user.order_notification }
          .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
