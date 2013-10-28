module Api
  module V1
    class BaseController < ApplicationController
    
    protected
    def resource_owner_check(params)
      if !current_user.nil?
        if params[:user_id] && params[:user_id] != current_user.id.to_s
          render :status => :forbidden, :json => Utilities::create_error_response(403, "Forbidden resource")
          return 
        end
      else
        render :status => :forbidden, :json => Utilities::create_error_response(403, "Forbidden resource")
        return 
      end
    end

    private
      def current_user
        if doorkeeper_token
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
      helper_method :current_user
    end

  end
end