Rails.application.routes.draw do

  
  resources :people
  resources :us
  resources :products
  resources :users
  resources :microposts

  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'people#new'
  

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
  
  root 'users#index'
  

  match ':controller(/:action(/:id))(.:format)',via: [:get, :post, :delete]
  get 'static_pages/home'
  get 'static_pages/show'
  get 'static_pages/help'
  get  '/help',    to: 'static_pages#help'
  get 'users/help'
  get  'users/show'
  get  'users/index2'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
