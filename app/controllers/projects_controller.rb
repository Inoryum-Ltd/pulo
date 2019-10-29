class ProjectsController < ApplicationController

def index
	@projects = Project.all
	@project_types = ProjectType.all
	@page_title = "Projects Completed"
end

def show
	@project = Project.friendly.find(params[:id])
	@page_title = @project.title
	@page_description = @project.description.to_s
end

end