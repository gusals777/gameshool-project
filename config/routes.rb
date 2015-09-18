Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) #관리자 루트 막으려면 이 부분을 주석 처리
    devise_for :users, controllers: {
        registrations: 'users/registrations'
    }
      
   root :to => "home#index"
  
  get   ":controller(/:action(/:id))"
  post  ":controller(/:action(/:id))"

end
