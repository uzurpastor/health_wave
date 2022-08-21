class ReceptionsController < ApplicationController
  def patient_list
    @receptions = current_doctor.receptions
    render 'receptions/patient_list'
  end
end
