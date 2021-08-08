# frozen_string_literal: true

Rails.application.routes.draw do
  resources :measures, only: %i[index create]
  resources :measurments
  get 'users/index'
  devise_for :users, controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  root to: 'home#index'
  get '/member', to: 'members#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
