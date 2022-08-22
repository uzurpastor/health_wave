# frozen_string_literal: true

module Doctors
  class ReceptionsController < ReceptionsController
    before_action :set_reception, except: :index

    def index
      @receptions = current_doctor.receptions.select(:id, :description, :user_id, :status, :time)

      render 'doctors/receptions/index'
    end

    def edit_time
      render 'doctors/receptions/edit_time'
    end

    def update_time
      if @reception.update(receptions_time_update_params)
        redirect_to doctors_index_reception_path,
                    flash: { success: 'Success set time' }
      else
        render 'doctors/receptions/edit_time'
      end
    end

    def edit_response
      render 'doctors/receptions/edit_response'
    end

    def update_response
      if @reception.update(receptions_response_update_params)
        redirect_to doctors_index_reception_path,
                    flash: { success: 'Success send feedback' }
      else
        render 'doctors/receptions/edit_response'
      end
    end

    protected

    def set_reception
      @reception = Reception.find params[:id]
    end

    def receptions_time_update_params
      params.require(:reception).permit(:time).merge status: :waiting
    end

    def receptions_response_update_params
      params.require(:reception).permit(:response).merge status: :reply
    end
  end
end
