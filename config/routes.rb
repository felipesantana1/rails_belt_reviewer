Rails.application.routes.draw do

  get '' => 'users#index'
  post 'user' => 'users#create'
  post 'user/login' => 'users#login'
  get 'user/:user_id' => 'users#edit'
  patch 'user/:user_id' => 'users#update'
  post'user/logout' => 'users#logout'
  get 'events' => 'events#home'
  post 'events' => 'events#create'
  get 'events/:event_id' => 'events#show'
  get 'events/:event_id/edit' => 'events#edit'
  patch 'events/:event_id/edit' => 'events#update'
  delete 'events/:event_id/destroy' => 'events#destroy'  
  post 'events/:event_id/join' => 'joins#create'
  post 'events/:event_id/message' => 'messages#create'
  delete 'events/:event_id/cancel' => 'joins#destroy'


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
