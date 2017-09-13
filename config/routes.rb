Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'challenges#index'

  get '/challenges/:id/challenger', to: 'challenges#challenger', as: 'challenger'

  resources :challenges do
    resources :comments
  end



end
