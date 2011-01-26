Rails3Base::Application.routes.draw do
  
  resources :data_sets do
    collection do
      get :category
    end
  end
  
  resources :organizations
  
  match 'about', :to => 'dashboard#about', :as => "about"
  
  
  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'
  end

  root :to => 'dashboard#index'
end
