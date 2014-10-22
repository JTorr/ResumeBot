class EducationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @master = master_resume
    @education = @master.educations.new
  end

  def create
    @education = Education.create new_education_params
    if @education.save
      # binding.pry
      master_resume.educations << @education
      redirect_to :back, notice: "Education added."
    else
      flash[:danger] = "Education could not be saved."
      redirect_to :back
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to :back
  end

  def index
    @resume = current_user.resumes.find(params[:id])
    @educations = @resume.educations.all
  end

  private

    def new_education_params
      params.permit(:institution, :area, :study_type, :start_date, :end_date, :gpa)
    end

    def education_params
      params.require(:education).permit(:institution)
    end
end
