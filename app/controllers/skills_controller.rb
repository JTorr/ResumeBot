class SkillsController < ApplicationController
  def new
    @master = master_resume
    @skill = @master.skills.new
  end

  def create
    # @master = current_user.resumes.where(master: true).first
    @skill = Skill.create(name: new_skill_params)
    if @skill.save
      binding.pry
      master_resume.skills << @skill
      redirect_to :back, notice: "Skill added."
    else
      flash[:danger] = "Skill could not be saved."
      redirect_to :back
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to :back
  end

  def index
    @resume = current_user.resumes.find(params[:id])
    @skills = @resume.skills.all
  end

  private

    def new_skill_params
      params.require(:name)
    end

    def skill_params
      params.require(:skill).permit(:name)
    end
end
