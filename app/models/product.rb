class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category

  STATUSES = %w[active inactive].freeze

  validates :name, :price, presence: true
  validates :status, inclusion: { in: STATUSES }

  scope :filter_by_sub_category, lambda { |sub_category|
    where(category: sub_category)
  }

  def truncated_description
    description ? description.truncate(30, separator: ' ') : ''
  end
end
