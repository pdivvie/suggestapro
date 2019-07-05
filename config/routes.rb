Rails.application.routes.draw do
  
  resources :categories
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}, controllers: { registrations: "registrations"}

  get 'my-services', to: 'businesses#my_services'
  get 'my-reviews', to: 'ratings#my_reviews'
  get 'faq', to: 'pages#faq'
  
  resources :locations do
    resources :businesses do
      resources :ratings
    end
  end

  root to: 'locations#index'
end
