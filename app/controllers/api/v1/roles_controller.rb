module Api
  module V1
    class RolesController < BaseController
      # TODO: this should be fixed once we introduce OAuth2
      # skip_before_filter :authorize
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with Role.all
      end

      # GET /roles/1.json
      def show
        @role = Role.find(params[:role])
        respond_with @roles
      end

      # POST /roles
      def create

        @role = Role.new(params[:role])

        if @role.save
          render json: @role, status: :created, location: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # PUT /roles/1.json
      def update
        @role = Role.find(params[:id])

        if @role.update_attributes(params[:role])
          return head :ok
        else
          render json: @role.errors, status: :unprocessable_entity
        end

      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @role = Role.find(params[:id])
        @role.destroy

        return head :ok
      end
    end

    protected
    def resource_owner_check 
      # How do I get current role that is requested? 
      if params[:audition_id]
        audition = Audition.find(params[:audition_id])
      else
      end
    end

    def collection  
      if params[:audition_id]
        Role.find_all_by_audition_id(params[:audition_id])
      else
        Role.all
      end
    end
  end
end

