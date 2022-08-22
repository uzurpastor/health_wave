# frozen_string_literal: true

class ReceptionsController < ApplicationController
  def show
    @reception = Reception.select(:id, :description, :user_id, :doctor_id, :status, :time).find params[:id]
    render 'receptions/show'
  end
end
