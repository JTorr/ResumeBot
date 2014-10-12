class SkillsController < ApplicationController
  def new
    @skill = current_user.skills.new
  end

  def create
    @resume = Resume.find(params[:id])
    @skill = current_user.skills.create(skill_params)
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
