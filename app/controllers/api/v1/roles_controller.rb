module Api
  module V1
    class RolesController < BaseController
      # TODO: this should be fixed once we introduce OAuth2
      before_filter { |c| c.audition_param_check(params) }
      before_filter(:only => [:update, :create]) {|c| c.audition_host_check(params)}
      before_filter(:only => [:show, :destroy, :update]) { |c| c.role_param_check(params) }
      
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with @audition.roles
      end

      # GET /roles/1.json
      def show
        respond_with @role
      end

      # POST /roles
      def create

        # @role = Role.new(params[:role])
        @role = @audition.roles.build(params[:role])

        if @role.save
          render json: @role, status: :created, location: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # PUT /roles/1.json
      def update
        if @role.update_attributes(params[:role])
          return head :ok
        else
          render json: @role.errors, status: :unprocessable_entity
        end

      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @role.destroy
        return head :ok
      end

      protected
      def audition_param_check(params)
        if params[:audition_id].nil?
          render :status => :bad_request, :json => Utilities::create_error_response(400, "audition_id is required path fields")
          return
        end
        @audition = Audition.find_by_id(params[:audition_id])
        if @audition.nil?
          render :status => :not_found, :json => Utilities::create_error_response(404, "audition_id is not found")
          return
        end
      end

      def audition_host_check(params)
        # Assuming @audition is already assigned. This maybe bad design as it is tighly coupled with previous filter.
        if current_user != @audition.host
          render :status => :forbidden, :json => Utilities::create_error_response(403, "Forbidden resource")
          return
        end
      end

      def role_param_check(params)
        @role = @audition.roles.find_by_id(params[:id])
        if @role.nil?
          render :status => :not_found, :json => Utilities::create_error_response(404, "role_id is not found")
          return
        end
      end
    end
  end
end

