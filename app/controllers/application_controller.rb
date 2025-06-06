class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path unless current_user.admin?
  end
end
