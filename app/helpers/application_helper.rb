module ApplicationHelper
  def get_pages
    Page.all.order(:title)
  end

  def get_categories
    Category.all.order(:name)
  end

  def get_brands
    Brand.all.order(:name)
  end
end
