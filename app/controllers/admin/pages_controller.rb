class Admin::PagesController < Admin::BaseController
	before_action :set_page, only: [:edit, :update, :destroy]  
	before_action :require_admin
	
	
	def index
		@pages = Page.all
	end
	
	def new
    @page = Page.new
    @page.build_metum
  end
	
	def create
		@page = Page.new(page_params)
     
    if @page.save
         flash[:success] = 'Page was successfully created.' 
         redirect_to admin_pages_path(@pages)
      else
        render 'new'
        end
	end
	
	def edit
		if !@page.metum.present?
      @page.build_metum 
    end
		
	end
	
	def update
		if @page.update(page_params)
        flash[:success] = 'Page was successfully updated'
        redirect_to admin_pages_path(@pages)
      else
        render 'edit'
      end
		
	end
	
	def destroy
		@page.destroy
    flash[:danger] = 'page was successfully deleted'
    redirect_to admin_pages_path
	end
	
	
	private
	
		def set_page
			@page = Page.friendly.find(params[:id])
		end
		
		def page_params
			params.require(:page).permit(:title, :body, :page_class, :add_menu, :slug, :page_cover, :remove_page_cover, metum_attributes: [:meta_title, :meta_description, :meta_keyword])
		end
	
	 def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?) # two Conditions one If not loggedin & loggin but current user not admin
      flash[:danger] = 'You are not allowed to perform this action'
      redirect_to admin_root_path
      
    end
  end
	
end