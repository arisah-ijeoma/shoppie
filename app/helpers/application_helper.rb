module ApplicationHelper
  def parent_categories
    Category.main
  end
end
