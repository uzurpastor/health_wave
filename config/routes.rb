# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               displays: 'users/displays'
             }

  controller 'users/displays' do
    get 'users/:id',
        action: :show,
        as: :user
  end
end
