class Doctors::DisplaysController < ApplicationController
  def show
    @doctor = Doctor.select(:id, :email, :name, :category).find(params[:id])
    render 'doctors/displays/show'
  end
end