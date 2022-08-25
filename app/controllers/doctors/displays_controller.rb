# frozen_string_literal: true

module Doctors
  class DisplaysController < ApplicationController
    def show
      @doctor = Doctor.select(:id, :email, :name, :category_id).find(params[:id])
      @category = Category.find @doctor.category_id
      render 'doctors/displays/show'
    end
  end
end
