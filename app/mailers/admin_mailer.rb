class AdminMailer < Devise::Mailer
  
	def new_user_signed_up(email)
      @email = email
      mail(to: Setting.first.admin_email, subject: 'New User has Signed up')
    end
    
    
end
