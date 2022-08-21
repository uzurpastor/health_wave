module Users
  class ReceptionsController < ReceptionsController
    def index
      @receptions = current_user.receptions
      render 'users/receptions/index'    
    end

    def new
      @reception = Reception.new
      @doctors = Doctor.all.collect { |p| [ p.name, p.id ] } 
    end

    def create
      reception = current_user.receptions.new( receptions_create_params )
      if reception.save
        redirect_to users_index_receptions_path,
          flash: { success: "wait for setting time" }
      else
        redirect_to users_new_reception_path,
          flash: { danger: "some problems" }
      end
    end

    protected

    def receptions_create_params
      params.require(:reception).permit(:doctor_id, :description).merge status: 'considering'
    end
  end
end