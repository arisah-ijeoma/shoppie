class Category < ApplicationRecord
  has_many :categories, foreign_key: :category_id, dependent: :destroy
  belongs_to :category, optional: true

  STATUSES = %w[active inactive].freeze

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }

  accepts_nested_attributes_for :categories

  scope :main, -> { where(category_id: nil) }
end
