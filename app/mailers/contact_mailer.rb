class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(contact)
   
    @name = contact.name
    @phone_number = contact.phone_number
    @email = contact.email
    @body = contact.body

    mail(to: Setting.first.admin_email, subject: 'Website Contact Request')
  end
end

