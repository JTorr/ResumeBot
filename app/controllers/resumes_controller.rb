class ResumesController < ApplicationController
  def new
    @master = current_user.resumes.where(master: true).first
    @resume = current_user.resumes.new
  end

  def create
    @master = current_user.resumes.where(master: true).first
    @resume = @master.clone
    @resume.update_attributes new_resume_params
    @resume.save

    if @resume.save
      redirect_to @resume, notice: "Successful"
    else
      flash[:danger] = "Resume could not be saved."
      render :new
    end
  end
  #
  # def select_skills
  #   Skill.update_all(["completed_at=?", Time.now], :id => params[:skill_ids])
  # end

  def index
  end

  def show
    @resume = current_user.resumes.find(params[:id])
  end

  def show_master
    @resume = current_user.resumes.where(master: true).first
  end

  def edit_master
    @master = current_user.resumes.where(master: true).first
  end

  def update_master
    # binding.pry
    @master = current_user.resumes.where(master: true).first
    if @master.update_attributes(params[update_master_params])
      render :show
    else
      flash[:danger] = "Resume could not be saved."
      render :show
    end
  end

  def update
    @resume = Resume.find params[:id]
    if @resume.update
      render :show
    else
      render_invalid @resume
    end
  end

    private

    def new_resume_params
      params.permit(:email, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state, skills: [])
    end

    def resume_params
      params.permit([:skills])
    end

end
