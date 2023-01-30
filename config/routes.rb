Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api' do
    resource :session, only: %i[create destroy], path: '/sessions'

    resources :locations do
      resources :meetings
    end
  end

  get "*path", to "welcome#index"
end
