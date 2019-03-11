Rails.application.routes.draw do
  
  resources :businesses
  root to: 'pages#home'
end
