Rails.application.routes.draw do


  get 'messages/create'

  get 'messages/show'

  get 'messages/index'

  get 'messages/delete'

  # namespace :concerns do
  # get 'admin/index'
  # end
  devise_for :users
  get 'news_item/:id' => 'news_items#show', as: 'news_item_show'

  resources :news_items, path: 'admin/news_items', only: [:create, :edit, :destroy, :update, :new] do
    collection do
      get 'index_page', as: 'list'
    end
  end
  get 'news_items' => 'news_items#index', as: 'news_items_list'
  resources :messages, path: 'admin/messages', except: [:new, :edit, :update]
  resources :images, path: 'admin/images', only: [:create, :edit, :destroy, :update, :new, :index]
  root to: 'pages#index'
  resources :admin, only: [:index]
  resources :pages, path: 'admin/pages', only: [:create, :edit, :destroy, :update, :new] do
    collection do
      get 'index_page', as: 'list'
    end
  end
  resources :pages, path: '', only: [:show]
  get ':parent_id/:id' => 'pages#show', :as => 'pages_full'


  # get 'admin/index' => 'pages#admin_index'

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
