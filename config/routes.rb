Rails3Base::Application.routes.draw do
  
  

  match 'suggest_a_data_set', :to => 'data_sets#suggest', :as => "suggest"
  resources :data_sets do
    collection do
      get :category
    end
    
    resources :comments
    
  end
  
  #resources :data_sets, :has_many => [:comments, :categories]
  
  resources :organizations
  resources :categories
  resources :government_levels
  
  #admin routes
  match 'admin/users', :to => 'admin#users', :as => "admin_users"
  match 'admin/make_user_admin/:id', :to => 'admin#make_user_admin', :as => "make_user_admin"
    
  #about routes
  match 'about', :to => 'dashboard#about', :as => "about"
  match 'omteam', :to => 'dashboard#omteam', :as => "omteam"
  match 'opensource', :to => 'dashboard#opensource', :as => "opensource"
  
  
  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'
  end

  root :to => 'dashboard#index'
end
