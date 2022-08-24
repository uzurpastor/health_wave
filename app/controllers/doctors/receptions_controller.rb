# frozen_string_literal: true

module Doctors
  class ReceptionsController < ReceptionsController
    before_action :set_reception, except: :index
    before_action :check_safety, except: :index

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

    ## need to create servece for safe
    def not_safety?
      case params[:action].humanize.split(' ').first
      when 'edit'
        safe_edit?
      when 'update'
        safe_update
      end
    end
    def safe_edit
      action = params[:action].to_s
      unless can? action, @reception 
        redirect_to doctors_index_reception_path,
                    flash: { danger: 'You cannot do this' } and return false
      end
      return true
    end
    def safe_update
      action = params[:action].to_s
      unless can? action, @reception 
        Rails.logger.error { 
          "#{params.inspect}" +
          "#=> someone is trying to illegally set invalid data " }
        return false
      end
      return true
    end
    def check_safety
      self.return if not_safety?
    end
    ## end block for safe


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
