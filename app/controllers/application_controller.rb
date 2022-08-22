# frozen_string_literal: true

class ApplicationController < ActionController::Base
  devise_group :account, contains: %i[user doctor]

  before_action :authenticate_account!, :current_ability
  # load_and_authorize_resource

  def current_ability
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
    elsif doctor_signed_in?
      @current_ability ||= Ability.new(current_doctor)
    end
  end
end
