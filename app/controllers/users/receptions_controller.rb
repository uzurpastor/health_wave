# frozen_string_literal: true

module Users
  class ReceptionsController < ReceptionsController
    before_action :collect_doctors_and_category, only: %i[new create]

    def index
      @receptions = current_user.receptions.select(:id, :description, :doctor_id, :status, :time)
      render 'users/receptions/index'
    end

    def new
      @reception = Reception.new
      render 'users/receptions/new'
    end

    def create
      @reception = current_user.receptions.new(receptions_create_params)
      if @reception.save
        redirect_to users_index_reception_path,
                    flash: { success: 'wait for setting time' }
      else
        render 'users/receptions/new'
      end
    end

    protected

    ## START Collector servece 
                  def collect_doctors_and_category
                    @grouped_options = collect_options
                  end

                  def collect_options
                    categories = Category.all
                    doctors = Doctor.find_free_now
                    collect = {}

                    categories.each do |category|
                      doctors_list = collect_doctors_by(category)
                      collect["#{category.name}"] = doctors_list
                    end
                    collect
                  end

                  def collect_doctors_by category
                    Doctor.find_free_now.map do |doctor|
                      doctor.name if category.doctors.include?(doctor)
                    end.compact
                  end
    ## END

    def receptions_create_params
      params.require(:reception).permit(:doctor_id, :description).merge status: :considering
    end
  end
end
