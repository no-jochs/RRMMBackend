Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'meeting_finder#index'

  namespace :api do
    resources :meetings, only: %i[index show]
    resources :locations, only: %i[index show]

    namespace :web_client do
      resources :meetings, only: [:index]
      resources :locations, only: [:show]
    end
  end
end
