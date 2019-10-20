class ApplicationController < ActionController::Base
  before_action :smtp_setting
  helper_method :recent_articles, :current_user, :logged_in?, :featured_articles, :categories_home, :page_menu, :setting
  
  def require_user
    if !user_signed_in?
      flash[:danger] = "You must be logged it to perform that action"
      redirect_to root_path
    end
  end
  
  def featured_articles
    @featured_articles = Article.all.where(:featured => true)
  end
  
  def page_menu
    @page_menu = Page.all.where(:add_menu => true)
  end
  
  def categories_home
    @category_home = Category.all
  end
  def recent_articles
    @recent_articles = Article.all.order("created_at desc").limit(5)
  end
   def after_sign_in_path_for(resource)
    admin_root_path
end

def setting
    @setting ||= Setting.first || Setting.new

    return @setting
  end
  
  def smtp_setting
    ActionMailer::Base.smtp_settings = {
     address:               setting.smtp_host,
     port:                  setting.smtp_port,
     domain:                setting.domain,
     user_name:             setting.smtp_user,
     password:              setting.smtp_password,
     authentication:       'plain',
     enable_starttls_auto: true
     }
  end
  
  
end
