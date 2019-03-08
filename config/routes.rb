Rails.application.routes.draw do
  resources :portfolios
  
  root to: 'pages#home'
end
