Rails3Base::Application.routes.draw do
  
  
  match 'data_sets/feed', :to => 'data_sets#feed', :action => 'feed'
  
  match 'suggest_a_data_set', :to => 'data_sets#suggest', :as => "suggest"
  match 'suggest_thanks', :to => 'data_sets#thanks', :as => "suggest_thanks"
  resources :data_sets do
    collection do
      get :category
    end
    
    resources :comments
    
  end
  
  #resources :data_sets, :has_many => [:comments, :categories]
  
  
  
  #admin routes
  #match 'admin', :to => 'admin#index', :as => "admin"
  #match 'admin/users', :to => 'admin#users', :as => "admin_users"
  #match 'admin/make_user_admin/:id', :to => 'admin#make_user_admin', :as => "make_user_admin"
    
  #about routes
  match 'about', :to => 'dashboard#about', :as => "about"
  match 'omteam', :to => 'dashboard#omteam', :as => "omteam"
  match 'opensource', :to => 'dashboard#opensource', :as => "opensource"
  match 'faq', :to => 'dashboard#faq', :as => "faq"
  match 'search', :to => 'dashboard#search', :as => "search"
  
  
  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'
  end
  
  resources :organizations
  resources :categories
  resources :government_levels
  resources :users
  
  root :to => 'dashboard#index'
end
