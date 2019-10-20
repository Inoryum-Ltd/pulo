
class Admin::ProjectTypesController < Admin::BaseController
	 before_action :require_admin
  def index
    @ProjectTypes = ProjectType.all
  end
  
  def new
    @ProjectType= ProjectType.new
  end
  
  def create
    @ProjectType = ProjectType.new(pt_params)
    
    if @ProjectType.save
      flash[:success] = 'Project Type  Was Created Successfully'
      redirect_to admin_project_types_path(@ProjectTypes)
      
    else
      render 'new'
    end
    
  end
  
  def edit
    @ProjectType = ProjectType.friendly.find(params[:id])
  end
  
  def update
     @ProjectType = ProjectType.friendly.find(params[:id])
    if @ProjectType.update(pt_params)
      flash[:success] = 'Project Type was successfully updated'
      redirect_to admin_project_types_path(@ProjectTypes)
      
    else
      render 'edit'
      
    end
    
  end
  
  def show
    
        @ProjectType = ProjectType.friendly.find(params[:id])
    
  end
  
  
  def destroy
    
    
    @ProjectType = ProjectType.friendly.find(params[:id])
    @ProjectType.destroy
    flash[:danger] = 'Project Type was successfully deleted'
    redirect_to admin_project_types_path
    
  end
  
  
  
  private
   def pt_params
      params.require(:project_type).permit(:name, :slug)
    end
    
     def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?) # two Conditions one If not loggedin & loggin but current user not admin
      flash[:danger] = 'You are not allowed to perform this action'
      redirect_to admin_root_path
      
    end
  end
end