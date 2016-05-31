Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'welcome' =>'welcome#index'
  get 'smartwatch' =>'welcome#smartwatch'
  get 'vinos' => 'welcome#vinos'
  get 'ofertas' => 'welcome#ofertas'

  get 'show' => 'welcome#show'
  get 'edit' => 'welcome#edit'
  post 'makeedition' => 'welcome#makeEdition'
  get 'delete' => 'welcome#delete'
  get 'products/:id' => 'welcome#json_preview', as: 'prod'


  get 'sessions/login' => 'sessions#login'

  get 'sessions/login_admin'
  post 'sessions/login_admin'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'sessions/login_attempt'
  post 'sessions/login_attempt'

  get 'sessions/login_attempt_admin'
  post 'sessions/login_attempt_admin'
  
  get 'sessions/logout' => 'sessions#logout'
  post 'sessions/logout' => 'sessions#logout'

  get 'sessions/recover'
  post 'sessions/send' =>'sessions#sendpass'

  
  #User

  get 'user/account'
  get 'user/info' => 'user#data'
  get 'user/password' => 'user#changepass'
  
  post 'user/makechange' =>'user#makechangepass'
  get 'user/makechange' =>'user#makechangepass'




  #root :to => "welcome#index"
  #match "signup", :to => "users#new"
  #match "login", :to => "sessions#login"
  #match "logout", :to => "sessions#logout"
  #match "home", :to => "sessions#home"
  #match "profile", :to => "sessions#profile"
  #match "setting", :to => "sessions#setting"

  #Administrador

  get 'admin' => 'sessions#login_admin'

  get 'admin/login' => 'sessions#login_admin'

  get 'admin/menu' => 'admin#menu'

  get 'admin/users' =>'admin#listUsers'

  get 'admin/new' => 'admin#new'
  post 'admin/create' 
  get 'admin/create' 

  get 'admin/showselect' =>'admin#showselect'
  post 'admin/show' => 'admin#show'
  get 'admin/show'

  
   get 'admin/edit' =>'admin#edituser'
  post 'admin/edit' => 'admin#edituser'

  get 'admin/makeedition'
  post 'admin/makeedition'

  get 'admin/blockselect' => 'admin#blockselect'
  post 'admin/block' => 'admin#block'
  get 'admin/block'

  get 'admin/activeselect' => 'admin#activeselect'
  post 'admin/activate' => 'admin#activate'
  get 'admin/activate'

  get 'admin/passselect' => 'admin#passselect'
  post 'admin/passselect' => 'admin#passselect'

  get 'admin/changepass' => 'admin#changepass'
  post 'admin/changepass' => 'admin#changepass'

  get 'admin/article'
  post 'admin/createarticle'
  

 


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
