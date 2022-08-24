# frozen_string_literal: true

module Users
  class ReceptionsController < ReceptionsController
    before_action :collect_doctors, only: %i[new create]

    def index
      @receptions = current_user.receptions.select(:id, :description, :doctor_id, :status, :time)
      render 'users/receptions/index'
    end

    def new
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

    def collect_doctors
      @doctors = Doctor.find_free_now.collect {|e| [e.name, e.id]}
    end

    def receptions_create_params
      params.require(:reception).permit(:doctor_id, :description).merge status: :considering
    end
  end
end
