class ContactMailer < ApplicationMailer
  def contact_email(name:, firstname:, email:, subject:, message:)
    @name = name
    @firstname = firstname
    @message = message

    mail(
      from: ENV["GMAIL_USERNAME"], # ou 'granjonfrederique@gmail.com'
      to: "granjonfrederique@gmail.com",
      subject: "[APsySE] Message de #{@firstname} #{@name} : #{subject}",
      reply_to: email
    )
  end
end
