module Api
  module V1
    class AuditionsController < BaseController
      # TODO: this should be fixed once we introduce OAuth2
      # skip_before_filter :authorize
      before_filter(:only => [:update, :create]) { |c| c.resource_owner_check(params)}

      doorkeeper_for :all
      respond_to :json

      def index
        @user = User.find_by_id(params[:user_id])
        type = params[:type]
        if @user.blank?
          respond_with Audition.all
          return
        end

        if "host" == type.downcase
          respond_with @user.created_auditions
        else
          respond_with @user.applied_auditions
        end
      end

      # GET /auditions/1
      # GET /auditions/1.json
      def show
        # @audition = Audition.find(params[:id])
        @audition = Audition.includes(roles: :applications).find(params[:id])
        respond_with @audition
      end

      # POST /auditions
      # POST /auditions.json
      # If ignore user_id field and grab current_user based on the authentication token. Why? because the newly created auditions should belong to the user
      def create
        # Do extra check: if the user_id field is not same as current_user, then 403
        # This code may not work since Audition doesn't have 'user' but it has 'host'

        @audition = current_user.created_auditions.build(params[:audition])
        # @audition = Audition.new(params[:audition])

        if @audition.save
          render json: @audition, status: :created, location: @audition
        else
          render json: @audition.errors, status: :unprocessable_entity
        end
      end

      # PUT /auditions/1
      # PUT /auditions/1.json
      def update
        @audition = Audition.find(params[:id])
        if @audition.host != current_user
          render :status => :forbidden, :json => Utilities::create_error_response(403, "Forbidden resource")
          return 
        end

        if @audition.update_attributes(params[:audition])
          return head :no_content
        else
          render json: @audition.errors, status: :unprocessable_entity
        end

      end

      # DELETE /auditions/1
      # DELETE /auditions/1.json
      def destroy
        @audition = Audition.find(params[:id])
        @audition.destroy

        return head :ok 
      end

      # TODO - Refactor this code out 
      private
      # def validate_params_for_index(params)
      #   if params[:user_id].empty?
      #     unless params[:type].empty?
      #       raise "type field missing"
      #     end
      #   end
      #   User.find_by_id(params[:user_id])
      # end

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

