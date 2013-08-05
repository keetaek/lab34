module Api
  module V1
    class AuditionsController < ApplicationController
      # TODO: this should be fixed once we introduce OAuth2
      skip_before_filter :authorize

      respond_to :json

      def index
        respond_with Audition.all
      end

      # GET /auditions/1
      # GET /auditions/1.json
      def show
        @audition = Audition.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @audition }
        end
      end

      # GET /auditions/new
      # GET /auditions/new.json
      def new
        @audition = Audition.new
        
        #Throw away code
        #3.times do
        role = @audition.roles.build
        #end
      
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @audition }
        end
      end

      # GET /auditions/1/edit
      def edit
        @audition = Audition.find(params[:id])
      end

      # POST /auditions
      # POST /auditions.json
      def create
        debugger
        @audition = Audition.new(params[:audition])

        respond_to do |format|
          if @audition.save
            debugger
            format.html { redirect_to @audition, notice: 'Audition was successfully created.' }
            format.json { render json: @audition, status: :created, location: @audition }
          else
            format.html { render action: "new" }
            format.json { render json: @audition.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /auditions/1
      # PUT /auditions/1.json
      def update
        @audition = Audition.find(params[:id])

        respond_to do |format|
          if @audition.update_attributes(params[:audition])
            format.html { redirect_to @audition, notice: 'Audition was successfully updated.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @audition.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @audition = Audition.find(params[:id])
        @audition.destroy

        respond_to do |format|
          format.html { redirect_to auditions_url }
          format.json { head :ok }
        end
      end
    end
  end
end

