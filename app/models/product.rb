class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :order_items

  STATUSES = %w[active inactive].freeze

  validates :name, :price, presence: true
  validates :status, inclusion: { in: STATUSES }

  delegate :admin_user, to: :category

  scope :filter_by_sub_category, lambda { |sub_category|
    where(category: sub_category)
  }

  scope :my_products, ->(admin_user) { joins(:category).where(categories: { admin_user_id: admin_user.id }) }

  def truncated_description
    description ? description.truncate(30, separator: ' ') : ''
  end
end
