module Api
  module V1
    class UsersController < BaseController
      doorkeeper_for :all
      
      def index
        @users = User.all
        
        respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @users }
        end
      end
      
      # GET /users/1
      # GET /users/1.json
      def show
        @user = User.find(params[:id])
        # @city_tags = User.tag_counts_on(:cities) => This is for all available list of cities (in the tag list)
        @city_tags ||= Array.new
        respond_to do |format|
          # BUG - There seems to be bug in rails code where if the first item in the json body is a custom object with as_json method and
          # second item is generic class like hash, then both need to pass in json hash object by calling as_json
          response = { :user => @user.as_json, :links => create_link('users', 'users', 'index').as_json }
          format.json { render :json => response }
        end
      end

      def create
        @user = User.new(params[:user])

        respond_to do |format|
          if @user.save
            format.json { render json: @user, status: :created, location: @user }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /auditions/1
      # PUT /auditions/1.json
      def update
        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.json { head :ok }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

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

