# frozen_string_literal: true

module Doctors
  class ReceptionsController < ReceptionsController
    before_action :set_reception, except: :index

    def index
      @filtering_status = status_param
      @receptions = reception_for_current_doctor_by @filtering_status
      render 'doctors/receptions/index'
    end

    def edit_time
      if safety_checker.safety?
        render 'doctors/receptions/edit_time'
      else
        redirect_to doctors_index_reception_path,
          flash: { danger: 'You cannot do this' } 
      end
    end

    def update_time
      return unless safety_checker.safety?

      if @reception.update(receptions_time_update_params)
        redirect_to doctors_index_reception_path,
                    flash: { success: 'Success set time' }
      else
        render 'doctors/receptions/edit_time'
      end
    end

    def edit_response
      if safety_checker.safety?
        render 'doctors/receptions/edit_response'
      else
        redirect_to doctors_index_reception_path,
          flash: { danger: 'You cannot do this' } 
      end 
    end

    def update_response
      return unless safety_checker.safety?

      if @reception.update(receptions_response_update_params)
        redirect_to doctors_index_reception_path,
                    flash: { success: 'Success send feedback' }
      else
        render 'doctors/receptions/edit_response'
      end
    end

  protected
    def safety_checker
      SafetyChecker.new(current_doctor, params, @reception)
    end

    def reception_for_current_doctor_by status
      current_doctor
        .receptions.where('status = ?', status)
        .select(:id, :description, :user_id, :status, :time, :response)
    end

    def status_param
      return 'process' if params.permit(:status).blank?
      params[:status]
    end

    def set_reception
      @reception = Reception.find params[:id]
    end

    def receptions_time_update_params
      params.require(:reception).permit(:time).merge status: :appoint
    end

    def receptions_response_update_params
      params.require(:reception).permit(:response).merge status: :close
    end
  end
end
