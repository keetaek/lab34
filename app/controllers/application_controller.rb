class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  force_ssl

  protected
    def authorize
      unless current_user
        redirect_to login_path, :notice => "Please log in"
      end
    end

  private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  helper_method :current_user
end
