Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show, :update, :index]
    resources :bugs, only: [:create, :show, :update, :index]
  end
end
