class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  validates :name, :address, presence: true, on: :update

  scope :with_orders, ->(admin_user) { where(id: order_list(admin_user)) }

  def self.order_list(admin_user)
    Order.user_list_for(admin_user)
  end
end
