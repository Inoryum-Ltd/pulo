class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy, :new]
  before_action :allow_without_password, only: [:update]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    if @user.save
      flash[:success] = "User(#{@user.username}) has been created successfully "
      redirect_to admin_users_path
      
    else
      render 'new'
    end
  end
  
  
  def edit
    @user.skip_confirmation!
   
  end
  
  def update
     if @user.update(user_params)
        
        flash[:success] = "#{@user.username}'s Profile Was Updated"
        redirect_to admin_users_path
      else
        render 'edit'
      end
  end
  
  def destroy
     @user.destroy
    flash[:danger] = 'User & all Articles created by user have been deleted'
    redirect_to admin_users_path
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :bio, :facebook, :twitter, :slug, :authorc, :remove_cover_image)
    end
  def set_user
       @user = User.friendly.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = 'You can only edit your own account'
      redirect_to admin_users_path
    end
  end
  
  
  def require_admin
    if user_signed_in? and !current_user.admin?
      flash[:danger] = 'Only Admin can Perform this Action'
      redirect_to admin_users_path
    end
  end


  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
       params[:user].delete(:password)
       params[:user].delete(:password_confirmation)
    end
  end
  
end