class Admin::SettingsController < Admin::BaseController
	 before_action :set_setting, only: [:update]
	 before_action :require_admin
	def index
		@setting = Setting.first
	end
	
	def edit
		
	end
	
	def update
		if @setting.update(setting_params)
        flash[:success] = 'Site was successfully updated'
        redirect_to admin_settings_path
      else
        render 'edit'
      end
	end
	
	
	private
	 def set_setting
      @setting= Setting.friendly.find(params[:id])
    end
	
	def setting_params
		params.require(:setting).permit( :site_title, :site_tag, :site_logo, :domain, :display_hero, :hero_title, :hero_image, :hero_bg,
																			:hero_content, :hero_button_text, :hero_button_link, :item_per_page, :smtp_host, :smtp_port, 
																			:smtp_user, :smtp_password, :admin_email, :remove_site_logo, :enable_smtp ) 
	end
	
	def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?) # two Conditions one If not loggedin & loggin but current user not admin
	    flash[:danger] = 'You are not allowed to perform this action'
	    redirect_to admin_root_path
  	end
  end
end
