class Admin::ProjectsController < Admin::BaseController
  before_action :set_project, only: [:edit, :update, :destroy]  
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @projects = Project.all

  end
  
  def edit
   
  end
  
  def new
    @project = Project.new
  end
  
  
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
     
    if @project.save
         flash[:success] = 'Project was successfully created.' 
         redirect_to admin_projects_path(@projects)
      else
        render 'new'
        end
  end
  
  def update

      if @project.update(project_params)
        flash[:success] = 'Project was successfully updated'
        redirect_to admin_projects_path
      else
        render 'edit'
      end
    
  end
  
  
  def destroy
    @project.destroy
    flash[:danger] = 'Project was successfully deleted'
    redirect_to admin_projects_path
  end
  
  private
  
    def set_project
      @project = Project.friendly.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:title, :description, :project_link, :slug, :project_type_id, :project_image, :remove_project_image) 
    end

    def find_project
       @project = Project.friendly.find(params[:id])
    end
  
    def require_same_user
      if current_user != @project.user and !current_user.admin?
        flash[:danger] = 'You can only edit or delete your own Projects'
        redirect_to projects_path
    end
    end
end
