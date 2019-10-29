class ArticlesController < ApplicationController
 
  def index
    @articles = Article.paginate(page: params[:page], per_page: 12).order("created_at DESC")
    @page_title = "Blog"
  end
  
  def show
    @article = Article.friendly.find(params[:id])
    @page_title = @article.title
    @page_description = @article.description.to_s
  end
  

end
