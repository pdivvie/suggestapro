Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}, controllers: { registrations: "registrations"}

  get 'legal-disclaimers', to: 'pages#legal_disclaimers'
  get 'about', to: 'pages#about'

  resources :locations do
    get 'my-services', to: 'businesses#my_services'
    get 'my-reviews', to: 'ratings#my_reviews'

    resources :categories, except: [:show]
    resources :subcategories, except: [:show]
    resources :businesses do
      resources :ratings
    end
  end

  root to: 'pages#home'
end
