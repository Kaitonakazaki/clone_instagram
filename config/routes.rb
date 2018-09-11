Rails.application.routes.draw do
  get '/', to:'home#index'

  resources :instagrams do
    collection do
      post :confirm
    end
  end
  resources :home
  resources :users
  resources :sessions
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
