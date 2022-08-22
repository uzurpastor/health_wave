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
      render 'doctors/receptions/edit_time'
    end
    def update_time

    end

    def edit_response
      render 'doctors/receptions/edit_response'
    end
    def update_response
      
    end
  end
end