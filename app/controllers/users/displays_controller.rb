# frozen_string_literal: true

module Users
  # Allow view User model information
  class DisplaysController < ApplicationController
    def show
      @user = User.select(:id, :email, :name).find(params[:id])
      render 'users/displays/show'
    end
  end
end
