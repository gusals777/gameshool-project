Rails.application.routes.draw do
 
   root :to => "home#index"
  
  get   ":controller(/:action(/:id))"
  post  ":controller(/:action(/:id))"

end
