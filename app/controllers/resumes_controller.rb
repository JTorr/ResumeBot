class ResumesController < ApplicationController
  def new
    @resume = current_user.resumes.new
  end

  def create
    @resume = current_user.resumes.create(resume_params)
    if @resume.save
      redirect_to @resume, notice: "Successful"
    else
      flash[:danger] = "Resume could not be saved."
      render :new
    end
  end

  def index
  end

  def show
    @resume = resume.find(params[:id])
  end

    private

    def resume_params
      params.require(:resume).permit(:email, :user_id, :first_name, :last_name, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state)
    end
end
