module Users
  class ReceptionsController < ReceptionsController
    before_action :collect_doctors, only: [:new, :create]

    def show 
      super
    end
    
    def index
      @receptions = current_user.receptions
      render 'users/receptions/index'    
    end

    def new
      @reception = Reception.new
      render 'users/receptions/new'
    end

    def create
      @reception = current_user.receptions.new( receptions_create_params )
      if @reception.save
        redirect_to users_index_receptions_path,
          flash: { success: "wait for setting time" }
      else
        render 'users/receptions/new'
      end
    end

    protected

    def collect_doctors
      @doctors= Doctor.all.collect { |p| [ p.name, p.id ] } 
    end

    def receptions_create_params
      params.require(:reception).permit(:doctor_id, :description).merge status: :considering
    end
  end
end