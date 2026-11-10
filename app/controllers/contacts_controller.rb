class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      begin
        ContactMailer.contact_email(
          name: @contact.name,
          firstname: @contact.firstname,
          email: @contact.email,
          subject: @contact.subject,
          message: @contact.message
        ).deliver_now
      rescue Net::SMTPError, SocketError, Timeout::Error, IOError => error
        Rails.logger.error("Contact email delivery failed: #{error.class}: #{error.message}")
        flash.now[:alert] = "L'envoi du message a échoué. Veuillez réessayer plus tard."
        return render :new, status: :service_unavailable
      end

      flash[:notice] = "Votre message a bien été envoyé"
      redirect_to root_path(anchor: "contact")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :firstname, :email, :subject, :message)
  end
end
