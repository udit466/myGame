Rails.application.routes.draw do
  
  Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'

  

end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end