Rails.application.routes.draw do
  
  # override clearance for user
  resources :users, only: [:index, :new, :create, :edit, :update, :show] do
    resources :listings, only: [:edit, :update, :destroy, :show, :new, :own_listings, :create]
    resources :reservations, only: [:edit, :update, :destroy, :show, :new, :own_reservations]
  end

  get "/users/:user_id/listings" => "listings#own_listings", as: "user_own_listings"
  get "/users/:user_id/reservations" => "reservations#own_reservations", as: "user_own_reservations"

  # clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

      # add callback URL after authentication is done
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

    # add listing routes
    # since create reservation is within listings' parameter, add create reservation routes in listing routes
  resources :listings do
    resources :reservations, only: [:create]
  end
  
    # add reservation routes
  resources :reservations, only: [:destroy]

    # add search routes
  resources :search, only: [:index]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     endgit 
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
end
