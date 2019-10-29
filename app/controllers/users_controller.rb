class UsersController < ApplicationController
  
  def show
    @user = User.friendly.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 6)
    @page_title = @user.username
    @page_description = @user.bio
  end
  
  
end
