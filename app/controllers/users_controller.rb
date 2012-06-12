class UsersController < ApplicationController
  skip_before_filter :authorize, :except => :index
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @city_tags = User.tag_counts_on(:cities)
    @city_tags ||= Array.new
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @city_tags = User.tag_counts_on(:cities)
    @city_tags ||= Array.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end

  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # This is part of the gem "Split" for AB testing
      # finished("signup_title")
      redirect_to login_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  # PUT /auditions/1
  # PUT /auditions/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
