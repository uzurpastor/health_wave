class ReceptionsController < ApplicationController

  def show
    @receptions = Reception.find params[:id]
    render 'receptions/show'
  end
end
