class Category < ApplicationRecord
  has_many :sub_categories, foreign_key: :parent_id
  has_many :children, through: :sub_categories, source: :child

  validates :name, presence: true
end
