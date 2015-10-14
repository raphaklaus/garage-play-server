Rails.application.routes.draw do
  resources :comments, except: [:new, :edit]
  match 'comments(/:id(.:format))' => 'comments#index', :via => :options
  match 'comments/getAllCommentsForReminder/:reminder_id' => 'comments#getAllCommentsForReminder', :via => :get

  resources :reminders, except: [:new, :edit]
  match 'reminders(/:id(.:format))' => 'reminders#index', :via => :options
  
  resources :contacts, except: [:new, :edit]
  match 'contacts(/:id(.:format))' => 'contacts#index', :via => :options

  resources :compromises, except: [:new, :edit]
  match 'compromises(/:id(.:format))' => 'compromises#index', :via => :options
  match 'compromises/load_more/:id' => 'compromises#load_more', :via => :get
  match 'compromises/load_recent/:id' => 'compromises#load_recent', :via => :get

  match 'notifications/send_email' => 'notifications#send_email', :via => :get
  match 'notifications/send_sms' => 'notifications#send_sms', :via => :get

  resources :users, except: [:new, :edit]
  match 'users(/:id(.:format))' => 'users#index', :via => :options
  match 'users/user_exist(/:id(.:format))' => 'users#user_exist', :via => :get

  match 'server/check_health' => 'server#check_health', :via => :get

  resources :bands
  match 'bands(/:id(.:format))' => 'bands#index', :via => :options
  match 'bands_search' => 'bands#search', :via => :get
  # match 'bands_test' => 'bands#test', :via => :get

  resources :band_requests, except: [:new, :edit]
  match 'band_requests(/:id(.:format))' => 'band_requests#index', :via => :options

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #     end
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
