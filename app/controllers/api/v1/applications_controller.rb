module Api
  module V1
    class ApplicationsController < BaseController
      # skip_before_filter :authorize
      before_filter(:only => [:create, :update]) { |c| return if c.resource_owner_check(params) == 403; return if c.param_check(params) == 400}

      doorkeeper_for :all, :except => :aws_sns_message
      respond_to :json

      def index
        unless params[:role_id].nil?
          @role = Role.find_by_id(params[:role_id])
          if @role.nil?
            render :status => :not_found, :json => Utilities::create_error_response(404, "Audition #{params[:role_id]} not found")
            return
          end
          respond_with @role.applications
          return
        end

        unless params[:audition_id].nil?
          @audition = Audition.find_by_id(params[:audition_id])
          if @audition.nil?
            render :status => :not_found, :json => Utilities::create_error_response(404, "Audition #{params[:audition_id]} not found")
            return
          end
          respond_with @audition.applications
          return
        end

        unless params[:user_id].nil?
          @user = User.find_by_id(params[:user_id])
          if @user.nil?
            render :status => :not_found, :json => Utilities::create_error_response(404, "User #{params[:user_id]} not found")
            return
          end
          respond_with @user.applications
          return
        end
        # NOTE: we are not returning all applications. (This will be a security breach). This is only for debugging purpose
        respond_with Application.all
      end



      # GET /auditions/1
      # GET /auditions/1.json
      def show
        @application = Application.find(params[:id])
        render json: @application
      end

      # POST /auditions
      # POST /auditions.json
      def create

        @role = Role.find_by_id(params[:role_id])
        if @role.nil?
          render :status => :not_found, :json => Utilities::create_error_response(404, "Role #{params[:role_id]} not found")
          return
        end

        @application = @role.applications.build(params[:application].merge(:user_id => current_user.id, :audition_id => params[:audition_id]))
        #Kick off sidekiq to request transcoding

        if @application.save
          render json: @application, status: :created, location: @application
        else
          render :status => :unprocessable_entity, :json => Utilities::create_error_response(422, "You already applied to this role")
        end

      end

      # PUT /applications/1
      # PUT /applications/1.json
      def update
        @application = Application.find(params[:id])
        if current_user.id != @application.user_id
          render :status => :forbidden, :json => Utilities::create_error_response(403, "Forbidden Resource")
          return 
        end

        if @application.update_attributes(params[:application])
          return head :ok
        else
          render json: @application.errors, status: :unprocessable_entity
        end
      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @application = Application.find(params[:id])
        @application.destroy
        return head :ok
      end

      def aws_sns_message
        debugger
      end

      protected
      def param_check(params)
        if params[:audition_id].nil? || params[:role_id].nil?
          render :status => :bad_request, :json => Utilities::create_error_response(400, "Audition and role IDs are required path fields")
          return 400
        end
      end
    end
  end
end

