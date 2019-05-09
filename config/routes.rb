# frozen_string_literal: true

Rails.application.routes.draw do
  get 'new/score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'pages#new', as: :new
  post 'score', to: 'pages#score', as: :score
end
