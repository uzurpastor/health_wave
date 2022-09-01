# frozen_string_literal: true

module Users
  class ReceptionsController < ReceptionsController

    def index
      @receptions = current_user.receptions.select(:id, :description, :doctor_id, :status, :time)
      render 'users/receptions/index'
    end

    def new
      @grouped_doctors = Collector.group_doctors_by_categories(Doctor.find_free_now)
      @reception = Reception.new
      render 'users/receptions/new'
    end

    def create
      @reception = current_user.receptions.new(receptions_create_params)
      if @reception.save
        redirect_to users_index_reception_path,
                    flash: { success: 'wait for setting time' }
      else
        render 'users/receptions/new'
      end
    end

    protected

    def receptions_create_params
      params.require(:reception).permit(:doctor_id, :description).merge status: :process
    end
  end
end
