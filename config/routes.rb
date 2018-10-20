Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'


  resources :recipees
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  

  resources :recipees do
    member do
      post 'like'
    end
  end
  
  
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
    
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  

end