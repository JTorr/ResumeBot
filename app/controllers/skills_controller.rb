class SkillsController < ApplicationController
  def new
    @resume = current_user.resumes.find(params[:id])
    @skill = @resume.skills.new
  end

  def create
    @resume = current_user.resumes.find(params[:id])
    @skill = @resume.create(skill_params)
    if @skill.save
      redirect_to @resume, notice: "Skill added."
    else
      flash[:danger] = "Skill could not be saved."
      render :new
    end
  end

  def index
    @resume = current_user.resumes.find(params[:id])
    @skills = @resume.skills.all
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
