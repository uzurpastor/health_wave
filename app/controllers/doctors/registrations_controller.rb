# frozen_string_literal: true

module Doctors
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    def new
      @categories = Category.all.collect {|c| [c.name, c.id]}
      super
    end

    def create
      @categories = Category.all.collect {|c| [c.name, c.id]}
      super
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[attribute name category_id])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      doctor_path(resource)
    end

    # The path used after sign up for inactive accounts.
  end
end
