class CategoriesController < ApplicationController
  
  def index
      @categories = Category.all
      @page_title = "Categories"
  end

 def show
    @category = Category.friendly.find(params[:id])
    @category_articles = @category.article.paginate(page: params[:page], per_page: 5)
    @page_title = custom_meta_title
    @page_description = custom_meta_description
    @page_keywords = custom_meta_keywords
  end
  
  private
	def custom_meta_title
		if @category.category_metum.present?
			@category.category_metum.meta_title
	  else
	  	@category.name
	  end
	end
	
	def custom_meta_description
		if @category.category_metum.present?
			@category.category_metum.meta_description
	  else
	  	@category.description
	  end
	end
	
	def custom_meta_keywords
		if @category.category_metum.present?
			@category.category_metum.meta_keyword
	  end
	end
  
end

