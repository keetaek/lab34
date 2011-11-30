class AuditionAdminsController < ApplicationController
  # GET /audition_admins
  # GET /audition_admins.json
  def index
    @audition_admins = AuditionAdmin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audition_admins }
    end
  end

  # GET /audition_admins/1
  # GET /audition_admins/1.json
  def show
    @audition_admin = AuditionAdmin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audition_admin }
    end
  end

  # GET /audition_admins/new
  # GET /audition_admins/new.json
  def new
    @audition_admin = AuditionAdmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audition_admin }
    end
  end

  # GET /audition_admins/1/edit
  def edit
    @audition_admin = AuditionAdmin.find(params[:id])
  end

  # POST /audition_admins
  # POST /audition_admins.json
  def create
    @audition_admin = AuditionAdmin.new(params[:audition_admin])

    respond_to do |format|
      if @audition_admin.save
        format.html { redirect_to @audition_admin, notice: 'Audition admin was successfully created.' }
        format.json { render json: @audition_admin, status: :created, location: @audition_admin }
      else
        format.html { render action: "new" }
        format.json { render json: @audition_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audition_admins/1
  # PUT /audition_admins/1.json
  def update
    @audition_admin = AuditionAdmin.find(params[:id])

    respond_to do |format|
      if @audition_admin.update_attributes(params[:audition_admin])
        format.html { redirect_to @audition_admin, notice: 'Audition admin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @audition_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audition_admins/1
  # DELETE /audition_admins/1.json
  def destroy
    @audition_admin = AuditionAdmin.find(params[:id])
    @audition_admin.destroy

    respond_to do |format|
      format.html { redirect_to audition_admins_url }
      format.json { head :ok }
    end
  end
end
