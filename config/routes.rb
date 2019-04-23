Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  resources :ratings
  resources :businesses
  root to: 'pages#home'
end
