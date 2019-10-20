class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  #after_action :toggle_admin
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    if user_signed_in? && current_user
    redirect_to user_path(current_user)
    end
  end
  
  
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 6)
  end
  
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :bio, :facebook, :twitter, :slug, :authorc)
    end
  def set_user
       @user = User.friendly.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = 'You can only edit your own account'
      redirect_to root_path
    end
  end
  
  
  def require_admin
    if user_signed_in and !current_user.admin?
      flash[:danger] = 'Only Admin can Perform this Action'
      redirect_to root_path
    end
  end
  
  # def toggle_admin
   # if User.first
   # User.first.toggle!(:admin)
   # end
 # end
  
end
