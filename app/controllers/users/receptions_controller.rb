module Users
  class ReceptionsController < ReceptionsController
    def index
      @receptions = current_user.receptions
      render 'users/receptions/index'    end
  end
end