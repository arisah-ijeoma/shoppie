class Category < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category, optional: true
  has_many :products, dependent: :destroy
  has_many :categories, foreign_key: :category_id, dependent: :destroy

  STATUSES = %w[active inactive].freeze

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }

  accepts_nested_attributes_for :categories

  scope :main, -> { where(category_id: nil) }
  scope :visible, -> { where(visible: true) }

  def self.visible_products
    visible.map(&:products).flatten
  end

  def all_products
    [products, categories.map(&:products)].flatten
  end
end
