class Admin::ArticlesController < Admin::BaseController
  protect_from_forgery with: :null_session
  before_action :set_article, only: [:edit, :update, :show, :destroy]  
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 12).order("created_at DESC")
    @User_articles = current_user.articles.paginate(page: params[:page], per_page: 12).order("created_at DESC")

  end
  
  def edit
   
  end
  
  def new
    @article = Article.new
    @article.build_article_metum
  end
  
  
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
     
    if @article.save
         flash[:success] = 'Article was successfully created.' 
         redirect_to admin_articles_path(@articles)
      else
        render 'new'
        end
  end
  
  def update

      if @article.update(article_params)
        flash[:success] = 'Article was successfully updated'
        redirect_to admin_articles_path(@article)
      else
        render 'edit'
      end
    
  end
  
  
  def show
    
  end
  
  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to admin_articles_path
  end
  
  private
  
    def set_article
      @article = Article.friendly.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description, :featured_image, :remove_featured_image, :slug, :featured, article_metum_attributes: [:meta_title, :meta_description, :meta_keyword], category_ids: []) 
    end

    def find_article
       @article = Article.friendly.find(params[:id])
    end
  
    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = 'You can only edit or delete your own articles'
        redirect_to articles_path
    end
    end
end
