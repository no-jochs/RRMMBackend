Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'meeting_finder#index'

  namespace :api do
    resources :meetings, only: %i[index show]
    resources :locations, only: %i[index show]
  end
end
