module Api
  module V1
    class ApplicationsController < BaseController
      # TODO: this should be fixed once we introduce OAuth2
      # skip_before_filter :authorize
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with Application.all
      end

      # GET /auditions/1
      # GET /auditions/1.json
      def show
        @application = Application.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @application }
        end
      end

      # POST /auditions
      # POST /auditions.json
      def create

        @application = Application.new(params[:application])

        respond_to do |format|
          if @application.save
            debugger
            format.html { redirect_to @application, notice: 'Audition was successfully created.' }
            format.json { render json: @application, status: :created, location: @application }
          else
            format.html { render action: "new" }
            format.json { render json: @application.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /auditions/1
      # PUT /auditions/1.json
      def update
        @application = Application.find(params[:id])

        respond_to do |format|
          if @application.update_attributes(params[:application])
            format.html { redirect_to @application, notice: 'Audition was successfully updated.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @application.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @application = Application.find(params[:id])
        @application.destroy

        respond_to do |format|
          format.html { redirect_to applications_url }
          format.json { head :ok }
        end
      end
    end
  end
end

