# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               displays: 'users/displays',
               receptions: 'users/receptions'
             }

  devise_for :doctors,
             controllers: {
               sessions: 'doctors/sessions',
               registrations: 'doctors/registrations',
               displays: 'doctors/displays',
               receptions: 'doctors/receptions'
             }

  namespace :doctors do
    patch 'receptions/:id/set_time', 
      controller: 'receptions',
      action: :set_time,
      as: :set_time_receptions

    patch 'receptions/:id/give_feedback', 
      controller: 'receptions',
      action: :give_feedback,
      as: :give_feedback_receptions

    get 'receptions',
      controller: 'receptions',
      action: :index,
      as: :index_receptions
  end

  namespace :users do 
    get 'receptions',
      controller: 'receptions',
      action: :index,
      as: :index_receptions
      
    post 'receptions',
      controller: 'receptions',
      action: :create
  end

# Show actions
  get 'users/:id',
        controller: 'users/displays',
        action: :show,
        as: :user
  get 'doctors/:id',
        controller: 'doctors/displays',
        action: :show,
        as: :doctor
  get 'reseptions/:id',
        controller: 'reseptions',
        action: :show,
        as: :reception
end
