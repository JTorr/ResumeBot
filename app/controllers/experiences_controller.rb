class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  def new
    @master = master_resume
    @experience = @master.experiences.new
  end

  def create
    @experience = Experience.create new_experience_params
    if @experience.save
      # binding.pry
      master_resume.experiences << @experience
      redirect_to :back, notice: "Work Experience added."
    else
      flash[:danger] = "Work Experience could not be saved."
      redirect_to :back
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to :back
  end

  def index
    @resume = current_user.resumes.find(params[:id])
    @experiences = @resume.experiences.all
  end

  private

    def new_experience_params
      params.permit(:company_name, :position, :start_date, :end_date, :summary)
    end

    def experience_params
      params.require(:experience).permit(:name)
    end
end
