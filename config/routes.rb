Rails.application.routes.draw do

  get 'jobs/index'

  get 'jobs/show'

  get 'jobs/new'

  get 'jobs/create'

  get 'skill/new'

  get 'skill/create'

  devise_for :users
  get 'static_pages/home'
  root to: "static_pages#home"
  get 'welcome' => 'resumes#new_master'
  post 'create_master' => 'resumes#create_master'
  get '/master' => 'resumes#show_master'
  get '/resumes/master/edit' => 'resumes#edit_master'
  put '/resumes/master/update' => 'resumes#update_master'
  post '/resumes/create' => 'resumes#create'

  # resources :skills do
  #   collection do
  #     put 'select'
  #   end
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :resumes

    # resources :resumes do
      resources :skills
    # end
    # resources :educations
    # resources :experiences

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
