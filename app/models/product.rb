class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category

  STATUSES = %w[active inactive].freeze

  validates :name, :price, presence: true
  validates :status, inclusion: { in: STATUSES }

  def truncated_description
    description.truncate(30, separator: ' ')
  end
end
