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
    get 'receptions',
        controller: 'receptions',
        action: :index,
        as: :index_reception

    get 'receptions/:id/time',
        controller: 'receptions',
        action: :edit_time,
        as: :new_time_receptions

    put 'receptions/:id/time',
        controller: 'receptions',
        action: :update_time,
        as: :update_time_receptions

    get 'receptions/:id/response',
        controller: 'receptions',
        action: :edit_response,
        as: :new_response_receptions

    put 'receptions/:id/response',
        controller: 'receptions',
        action: :update_response,
        as: :update_response_receptions
  end

  namespace :users do
    get 'receptions',
        controller: 'receptions',
        action: :index,
        as: :index_reception

    get 'receptions/new',
        controller: 'receptions',
        action: :new,
        as: :new_reception

    post 'receptions',
         controller: 'receptions',
         action: :create,
         as: :create_reception
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
  get 'receptions/:id',
      controller: 'receptions',
      action: :show,
      as: :reception
end
