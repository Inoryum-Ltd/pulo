class ArticlesController < ApplicationController
 
  def index
    @articles = Article.paginate(page: params[:page], per_page: 12).order("created_at DESC")
    @page_title = "Blog"
  end
  
  def show
    @article = Article.friendly.find(params[:id])
    @page_title = custom_meta_title
    @page_description = custom_meta_description
    @page_keywords = custom_meta_keywords
  end
  
  
  def custom_meta_title
    if @article.article_metum.present?
      @article.article_metum.meta_title
    else
      @article.title
    end
  end
  
  def custom_meta_description
    if @article.article_metum.present?
      @article.article_metum.meta_description
    else
      @article.description.to_s
    end
  end
  
   def custom_meta_keywords
    if @article.article_metum.present?
      @article.article_metum.meta_keyword
    end
  end

end
