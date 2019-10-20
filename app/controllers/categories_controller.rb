class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categories = Category.all
 end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = 'Category Was Created Successfully'
      redirect_to admin_categories_path(@admin_categories)
     
    else
      render 'new'
    end
    
  end
  
  def edit
    @category = Category.friendly.find(params[:id])
  end
  
  def update
     @category = Category.friendly.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'Category was successfully updated'
      redirect_to category_path(@category)
      
    else
      render 'edit'
      
    end
    
  end
  
  def show
    
        @category = Category.friendly.find(params[:id])
        @category_articles = @category.article.paginate(page: params[:page], per_page: 5)
    
  end
  
  
  def destroy
    
    
    @category = Category.friendly.find(params[:id])
    @category.destroy
    flash[:danger] = 'Category was successfully deleted'
    redirect_to categories_path
    
  end
  
  
  
  private
   def category_params
      params.require(:category).permit(:name, :description, :cover_image_cat)
    end
  
  def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?) # two Conditions one If not loggedin & loggin but current user not admin
      flash[:danger] = 'You are not allowed to perform this action'
      redirect_to categories_path
      
    end
  end
  
end

