class Product < ApplicationRecord
  belongs_to :category

  STATUSES = %w[active inactive].freeze

  validates :name, :price, presence: true
  validates :status, inclusion: { in: STATUSES }
end
