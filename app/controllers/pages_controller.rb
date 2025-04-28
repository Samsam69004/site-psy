# app/controllers/pages_controller.rb

class PagesController < ApplicationController


  def contact
    if params[:name].present? && params[:email].present? && params[:message].present?
      # ici tu peux envoyer un mail par exemple
      flash[:notice] = "Votre message a bien été envoyé. Merci !"
    else
      flash[:notice] = "Merci de remplir tous les champs avant d'envoyer."
    end

    redirect_to root_path(anchor: "contact")
  end

  def mentions_legales
  end

  def politique_confidentialite
  end
end
