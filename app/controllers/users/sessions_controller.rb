# frozen_string_literal: true

module Users
  # Allows you to remember users based on cookies. Manages the creation and deletion of tokens.
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
