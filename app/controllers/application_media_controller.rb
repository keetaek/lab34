class ApplicationMediaController < ApplicationController
  # GET /application_media
  # GET /application_media.json
  def index
    @application_media = ApplicationMedium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_media }
    end
  end

  # GET /application_media/1
  # GET /application_media/1.json
  def show
    @application_medium = ApplicationMedium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_medium }
    end
  end

  # GET /application_media/new
  # GET /application_media/new.json
  def new
    @application_medium = ApplicationMedium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_medium }
    end
  end

  # GET /application_media/1/edit
  def edit
    @application_medium = ApplicationMedium.find(params[:id])
  end

  # POST /application_media
  # POST /application_media.json
  def create
    @application_medium = ApplicationMedium.new(params[:application_medium])

    respond_to do |format|
      if @application_medium.save
        format.html { redirect_to @application_medium, notice: 'Application medium was successfully created.' }
        format.json { render json: @application_medium, status: :created, location: @application_medium }
      else
        format.html { render action: "new" }
        format.json { render json: @application_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_media/1
  # PUT /application_media/1.json
  def update
    @application_medium = ApplicationMedium.find(params[:id])

    respond_to do |format|
      if @application_medium.update_attributes(params[:application_medium])
        format.html { redirect_to @application_medium, notice: 'Application medium was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_media/1
  # DELETE /application_media/1.json
  def destroy
    @application_medium = ApplicationMedium.find(params[:id])
    @application_medium.destroy

    respond_to do |format|
      format.html { redirect_to application_media_url }
      format.json { head :ok }
    end
  end
end
