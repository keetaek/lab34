Lab34::Application.routes.draw do
  
  
  use_doorkeeper

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :auditions do
        resources :roles do
          resources :applications
        end
      end
      # id could have dot for emails. Hence not recognizing email as type
      resources :users, :constraints => { :id => /[^\/]*/ } do
        get 'me', on: :collection
        resources :auditions
        resources :applications
      end

      resources :auditions do 
        resources :applications
      end

      resources :roles do
        resources :applications
      end
    end
  end
    # scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #   resources :products
    # end

  resources :users do
    resources :videos
    # resources :pictures, :only => [:index, :create, :destroy]
    resources :pictures do
      # collection do
      #   get "smart_new"
      #   post "smart_create"
      # end
    end
    resources :applications
  end


  resources :user_details
  resources :audition_admins
  resources :application_reviews
  resources :application_question_answers
  resources :role_questions
  # resources :media
  # resources :application_media

  resources :applications do
    resources :videos
    resources :pictures
    # resources :application_question_answers
  end

  resources :roles do 
    resources :applications do
    end
  end

  resources :auditions do 
    resources :roles
  end

  resources :videos  
  resources :pictures
  
  resources :password_resets

  get 'login' => "sessions#new", :as => 'login'
  post 'login' => "sessions#create"
  get 'logout' => "sessions#destroy", :as => 'logout'

  match 'users/:id/profile' => 'users#show'

  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "auditions#new"

  
  resources :sessions

  mount Split::Dashboard, at: 'split'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
