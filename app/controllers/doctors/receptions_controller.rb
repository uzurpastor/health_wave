module Doctors
  class ReceptionsController < ReceptionsController
    def index
      @receptions = current_doctor.receptions
      render 'doctors/receptions/index'
    end
  end
end