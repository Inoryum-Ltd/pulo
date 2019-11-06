class ProjectsController < ApplicationController

def index
	@projects = Project.all
	@project_types = ProjectType.all
	@page_title = "Projects Completed"
end

def show
	@project = Project.friendly.find(params[:id])
	@page_title =custom_meta_title
	@page_description = custom_meta_description
	@page_keywords = custom_meta_keywords
end



private 
	def custom_meta_title 
		if @project.project_metum.present?
				@project.project_metum.meta_title
		else
			@project.title
		end
 	end
	def custom_meta_description
		if @project.project_metum.present?
				@project.project_metum.meta_description
		else
			@project.description.to_s
		end
	end
	def custom_meta_keywords
			if @project.project_metum.present?
				@project.project_metum.meta_keyword
		end
	end
	
end