Carsurvey::Application.routes.draw do
  resources :users
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
  match "/sign_up" => "users#sign_up"
  match "sign_in_act" => "users#sign_in_act"
  match "sign_up_act" => "users#sign_up_act"
  match "/welcome" => "users#welcome",:method => "PUT"
  match "/question2" => "users#question2",:method => "PUT"
  match "/question3" => "users#question3",:method => "PUT"
  match "/question4" => "users#question4",:method => "PUT"
  match "/question5" => "users#question5",:method => "PUT"
  match "/question6" => "users#question6",:method => "PUT"
  match "/question7" => "users#question7",:method => "PUT"
  match "/question8" => "users#question8",:method => "PUT"
  match "/question9" => "users#question9",:method => "PUT"
  match "/brandinterest" => "users#brandinterest",:method => "PUT"
  match "/brandinterest_save" => "users#brandinterest_save",:method => "PUT"
  match "/vehicleinterest" => "users#vehicleinterest",:method => "PUT"
  match "/vehicleinterest_save" => "users#vehicleinterest_save",:method => "PUT"
  match "/qualified" => "users#qualified",:method => "PUT"
  match "/disqualified" => "users#disqualified",:method => "PUT"
  match "/inmarket" => "users#inmarket",:method => "PUT"
  match "/inmarket_save" => "users#inmarket_save",:method => "PUT"
  match "/vehiclepreference" => "users#vehiclepreference",:method => "PUT"
  match "/buylease" => "users#buylease",:method => "PUT"
  match "/cost" => "users#cost",:method => "PUT"
  match "/currentcar" => "users#currentcar",:method => "PUT"
  match "/signout" => "users#sign_out",:method => "PUT"
  match "checkmail" => "users#checkmail",:method => "PUT"
  

 
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
  # root :to => 'welcome#index'
  root :to => 'users#sign_in'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
