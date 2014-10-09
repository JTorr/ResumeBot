class CvsController < ApplicationController
  def new
    @cv = current_user.cvs.new
  end

  def create
    @cv = current_user.cvs.create(cv_params)
    # binding.pry
    if @cv.save
      redirect_to @cv, notice: "Successful"
    else
      flash[:danger] = "Cv could not be saved."
      render :new
    end
  end

  def index
  end

  def show
    @cv = Cv.find(params[:id])
  end

    private

    def cv_params
      params.require(:cv).permit(:email, :user_id, :first_name, :last_name, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state)
    end
end
