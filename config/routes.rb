Sample::Application.routes.draw do

  get   '/user'                  => 'user#index'
  get   '/user/create'           => 'user#add'
  post  '/user/create'           => 'user#create'
  patch '/user/update'           => 'user#update'
  get   '/user/update/:id'       => 'user#edit'
  get   '/user/:id'              => 'user#show'

  get   '/item'                  => 'item#index'
  get   '/item/create'           => 'item#add'
  post  '/item/create'           => 'item#create'
  patch '/item/update'           => 'item#update'
  get   '/item/update/:id'       => 'item#edit'
  get   '/item/:id'              => 'item#show'

  get   '/history'               => 'history#index'
  get   '/history/:id'           => 'history#show'
  get  '/history/lend/add'      => 'history#lend_add'
  post  '/history/lend/create'   => 'history#lend_create'
  post  '/history/return/add'    => 'history#return_add'
  post  '/history/return/create' => 'history#return_create'
  get   '/history/returned'      => 'history#reserve'
  post  '/history/returned'      => 'history#reserved'


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
