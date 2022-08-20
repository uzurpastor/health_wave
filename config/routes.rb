# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               displays: 'users/displays'
             }
  
  devise_for :doctors,
             controllers: {
               sessions: 'doctors/sessions',
               registrations: 'doctors/registrations',
               displays: 'doctors/displays'
             }

  controller 'users/displays' do
    get 'users/:id',
        action: :show,
        as: :user
  end

  controller 'doctors/displays' do
    get 'doctors/:id',
        action: :show,
        as: :doctor
  end
end
