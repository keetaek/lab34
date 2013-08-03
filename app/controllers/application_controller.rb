class ApplicationController < ActionController::Base
  # before_filter :authorize
  protect_from_forgery
  force_ssl

  protected
    def authorize
      unless current_user
        debugger
        redirect_to login_path, :notice => "Please log in"
      end
    end

  private
  
    def current_user
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end
  helper_method :current_user
end
