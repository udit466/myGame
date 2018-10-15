Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'


  resources :recipees
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  

  resources :recipes do
    member do
      post 'like'
    end
  end
  
  
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  

end