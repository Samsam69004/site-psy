# app/controllers/admin_panel/pages_controller.rb

module AdminPanel
  class PagesController < ApplicationController
    before_action :authenticate_admin!

    def index
      @pages = Page.all
    end

    def edit
      @page = Page.find(params[:id])
    end

    def update
      @page = Page.find(params[:id])
      if @page.update(page_params)
        redirect_to admin_panel_pages_path, notice: "Page mise à jour avec succès."
      else
        render :edit
      end
    end

    private

    def page_params
      params.require(:page).permit(:title, :slug, :content)
    end
  end
end
