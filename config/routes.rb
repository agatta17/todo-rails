require "sidekiq/web"


Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  root "tasks#index"

  resources :tasks
end
