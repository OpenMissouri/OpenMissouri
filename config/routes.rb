Rails3Base::Application.routes.draw do

  resources :sunshine_requests

  match 'data_sets/feed', :to => 'data_sets#feed', :action => 'feed'
  match 'suggest_a_data_set', :to => 'data_sets#suggest', :as => "suggest"
  match 'suggest_thanks/:id', :to => 'data_sets#thanks', :as => "suggest_thanks"
  match 'sunshine/:id', :to => 'data_sets#sunshine', :as => "sunshine"
  match 'pages/:section/', :to => 'pages#index', :as => "section"  
  match 'pages/:section/:id', :to => 'pages#show', :as => "page"
  
  resources :pages
  
  resources :data_sets do
    collection do
      get :category
    end
    resources :comments
  end
    
  #about routes
  match 'about', :to => 'pages#about', :as => "about"
  match 'omteam', :to => 'pages#omteam', :as => "omteam"
  match 'opensource', :to => 'pages#opensource', :as => "opensource"
  match 'faq', :to => 'pages#faq', :as => "faq"
  match 'search', :to => 'dashboard#search', :as => "search"
  match 'privacy', :to => 'dashboard#privacy', :as => "privacy"
  match 'terms', :to => 'dashboard#terms', :as => "terms"
  
  match 'contact', :to => 'dashboard#contact', :as => "contact"

  devise_for :users, :controllers => { :registrations => "registrations" }
  
  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'registrations#new', :as => 'new_user_registration'
  end
  
  resources :organizations
  resources :categories
  resources :government_levels
  resources :users
  
  root :to => 'dashboard#index'
end
