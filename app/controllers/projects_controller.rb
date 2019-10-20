class ProjectsController < ApplicationController

def index
	@projects = Project.all
	@project_types = ProjectType.all
end

def show
	@project = Project.friendly.find(params[:id])
end

end