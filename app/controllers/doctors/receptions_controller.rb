module Doctors
  class ReceptionsController < ReceptionsController
    def show 
      super
    end

    def index
      @receptions = current_doctor.receptions
      render 'doctors/receptions/index'
    end

    def edit_time
      @reception = Reception.find params[:id]
      render 'doctors/receptions/edit_time'
    end
    def update_time
      reception = Reception.find params[:id]
      if reception.update(receptions_time_update_params)
        redirect_to doctors_index_reception_path,
          flash: {success: 'Success set time'}
      else
        redirect_to doctors_new_time_receptions_path,
          flash: {danger: 'some problems'}
      end
    end

    def edit_response
      @reception = Reception.find params[:id]
      render 'doctors/receptions/edit_response'
    end
    def update_response
      reception = Reception.find params[:id]
      if reception.update(receptions_response_update_params)
        redirect_to doctors_index_reception_path,
          flash: {success: 'Success send feedback'}
      else
        redirect_to doctors_new_response_receptions_path,
          flash: {danger: 'some problems'}
      end
    end

    protected

    def receptions_time_update_params
      params.require(:reception).permit(:time).merge status: :waiting      
    end

    def receptions_response_update_params
      params.require(:reception).permit(:response).merge status: :reply      
    end
  end
end