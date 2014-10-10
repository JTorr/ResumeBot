class SkillController < ApplicationController
  def new
    @resume = resume.find(params[:id])
    @skill = @resume.skills.new
  end

  def create
    @resume = resume.find(params[:id])
    @skill = @resume.create(skill_params)
    if @skill.save
      redirect_to @resume, notice: "Skill added."
    else
      flash[:danger] = "Skill could not be saved."
      render :new
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
