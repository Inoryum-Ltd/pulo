class CategoriesController < ApplicationController
  
  def index
      @categories = Category.all
      @page_title = "Categories"
  end

 def show
    @category = Category.friendly.find(params[:id])
    @category_articles = @category.article.paginate(page: params[:page], per_page: 5)
    @page_title = @category.name
    @page_description = @category.description
  end
  
  
end

