class Admin::DashboardsController < Admin::BaseController
  
  def index
    @db_articles = Article.all
    @user_articles = current_user.articles
    @pages = Page.all
    @projects = Project.all
    @categories = Category.all
    @users = User.all
  end
  
  
 
end
