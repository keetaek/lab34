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
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
