Rails.application.routes.draw do 
  
  devise_for :users
  root 'main#home'
  
  get '/home' => 'main#home' 
  
  post '/home/:id' => 'main#home' 

  get '/profile'=> 'main#profile'
  
  get '/profile/:id'=> 'main#profile'
   
  get '/view' => 'main#view'
  
  get '/view/:id' => 'main#view'
  
  get '/view/:id/:date' => 'main#view'
  
  get '/share' => 'main#share'
   
  post '/user_adjust/:u_id' => 'main#user_adjust' 
  
  post '/p_write' => 'post#p_write'
  
  get '/p_delete/:p_id' => 'post#p_delete'
  
  post '/adjust/:p_id' => 'post#adjust'
  
  post '/c_write/:p_id' => 'comment#c_write'
  
  get '/c_delete/:c_id' => 'comment#c_delete'
  
  devise_for :admins
  mount RailsAdmin::Engine => '/admin'
  
  
   

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
