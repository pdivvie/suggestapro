Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  
  resources :businesses do
    resources :ratings, except: [:show, :index]
  end

  root to: 'pages#home'
end
