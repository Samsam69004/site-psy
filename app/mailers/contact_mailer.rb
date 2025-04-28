
class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(
  from: ENV["GMAIL_USERNAME"], # ou hardcoded 'granjonfrederique@gmail.com'
  to: 'granjonfrederique@gmail.com',
  subject: "[APsySE] Message de #{@contact.firstname} #{@contact.name}",
  reply_to: @contact.email
)

  end
end
