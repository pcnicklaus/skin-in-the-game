Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile


  root 'challenges#index'

  get '/challenges/:id/challenger', to: 'challenges#challenger', as: 'challenger'

  resources :challenges do
    resources :comments
  end



end
