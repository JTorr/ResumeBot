class ResumesController < ApplicationController
  def new
    @master = current_user.resumes.where(master: true).first
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
    if @master.update_attributes(update_master_params)
      render :show
    else
      flash[:danger] = "Resume could not be saved."
      render :show
    end
  end

  def update
    @resume = Resume.find params[:id]
    if @resume.update update_params
      render :show
    else
      render_invalid @resume
    end
  end

    private

    def update_master_params
      params.permit(:email, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state)
    end

    def resume_params
      params.require(:resume).permit(:email, :first_name, :last_name, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state)
    end
end
