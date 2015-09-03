Rails.application.routes.draw do
 
  devise_for :users
   root :to => "home#index"
  
  get   ":controller(/:action(/:id))"
  post  ":controller(/:action(/:id))"

end
