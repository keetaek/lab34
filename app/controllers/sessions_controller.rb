class SessionsController < ApplicationController
  skip_before_filter :authorize
  # GET /sessions/new
  # GET /sessions/new.json
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      #session[:user_id] = user.id
      if params[:remember_me]
        logger.debug "KEETAEK Permanent token set " + user.auth_token.to_s
        cookies.permanent[:auth_token] = user.auth_token
      else
        logger.debug "KEETAEK Temporary token set " + user.auth_token.to_s
        cookies[:auth_token] = user.auth_token
      end
      
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
