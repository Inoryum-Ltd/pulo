
class Admin::CategoriesController < Admin::BaseController
	 before_action :require_admin
  def index
    @admin_categories = Category.all
  end
  
  def new
    @admin_category = Category.new
  end
  
  def create
    @admin_category = Category.new(category_params)
    
    if @admin_category.save
      flash[:success] = 'Category Was Created Successfully'
      redirect_to admin_categories_path(@admin_categories)
      
    else
      render 'new'
    end
    
  end
  
  def edit
    @admin_category = Category.friendly.find(params[:id])
  end
  
  def update
     @admin_category = Category.friendly.find(params[:id])
    if @admin_category.update(category_params)
      flash[:success] = 'Category was successfully updated'
      redirect_to admin_categories_path(@admin_categories)
      
    else
      render 'edit'
      
    end
    
  end
  
  def show
    
        @admin_category = Category.friendly.find(params[:id])
        @admin_ategory_articles = @category.article.paginate(page: params[:page], per_page: 5)
    
  end
  
  
  def destroy
    
    
    @admin_category = Category.friendly.find(params[:id])
    @admin_category.destroy
    flash[:danger] = 'Category was successfully deleted'
    redirect_to admin_categories_path
    
  end
  
  
  
  private
   def category_params
      params.require(:category).permit(:name, :description, :cover_image_cat)
    end
    
     def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?) # two Conditions one If not loggedin & loggin but current user not admin
      flash[:danger] = 'You are not allowed to perform this action'
      redirect_to admin_root_path
      
    end
  end
end