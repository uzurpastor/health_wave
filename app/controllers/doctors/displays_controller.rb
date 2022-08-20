class Doctor::DisplaysController < ActionController
  def show
    @doctor = Doctor.select(:id, :email, :name).find(params[:id])
    render 'doctors/displays/show'
  end
end