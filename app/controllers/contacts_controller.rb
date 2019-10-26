class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @page_title = "Contact"
  end
  
def create
    @contact = Contact.new contact_params
  
      if @contact.valid?
        ContactMailer.contact(@contact).deliver_now
        redirect_to contact_path
        flash[:success] = "We have received your message and will be in touch soon!"
     else
      flash[:danger] = "There was an error sending your message. Please try again."
      render :new
    end
  
  end
  
private
def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :body)
  end
end
