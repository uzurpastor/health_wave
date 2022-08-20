# frozen_string_literal: true

class ApplicationController < ActionController::Base
  devise_group :account, contains: %i[user doctor]

  before_action :authenticate_account!
end
