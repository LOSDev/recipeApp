Rails.application.routes.draw do
  scope :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :recipes, except: [:new, :edit] do
      collection do
        get 'search'
      end
      resources :reviews, only: [:index, :create]
    end
  end
  root 'home#index'
end
