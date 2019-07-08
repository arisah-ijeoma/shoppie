class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :order_items
  has_many :categories, dependent: :destroy

  def order_notification
    Notifier.order_notification(self).deliver_now
  end
end
