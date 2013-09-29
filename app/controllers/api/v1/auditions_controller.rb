module Api
  module V1
    class AuditionsController < BaseController
      # TODO: this should be fixed once we introduce OAuth2
      # skip_before_filter :authorize
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with Audition.all
      end

      # GET /auditions/1
      # GET /auditions/1.json
      def show
        @audition = Audition.find(params[:id])

        respond_to do |format|
          format.json { render json: @audition }
        end
      end

      # POST /auditions
      # POST /auditions.json
      def create
        @audition = Audition.new(params[:audition])

        respond_to do |format|
          if @audition.save
            format.json { render json: @audition, status: :created, location: @audition }
          else
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
            format.json { head :ok }
          else
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

      # TODO - Refactor this code out 
      private
      def create_link(name, controller, action)
        link = {
          name => {
            :href => url_for(:controller => controller, :action => action)
          }
        }
        return link
      end
    end
  end
end

