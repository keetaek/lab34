class ApplicationController < ActionController::Base
  # before_filter :authorize
  protect_from_forgery
  force_ssl

  protected
    def authorize
      unless current_web_user
        redirect_to login_path, :notice => "Please log in"
      end
    end

  private
  
  # Commenting out as we are introducing base_controller with doorkeeper
    def current_web_user

      @current_web_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    helper_method :current_web_user
end
