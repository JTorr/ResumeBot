class ResumesController < ApplicationController
  def new
    @master = current_user.resumes.where(master: true).first
    @resume = current_user.resumes.new
  end

  def create
    @master = current_user.resumes.where(master: true).first
    @skills = params["skill_ids"].to_a
    @new_atts = @master.attributes.merge(skills: @skills)
    @new_atts.delete(:id, :master)
    binding.pry

    @resume = current_user.resumes.new(@new_atts)
    last_id = Resume.last.id
    @resume.update_attributes(id: last_id + 1)
    # binding.pry
    @resume.save

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
      params.permit(skills: :skill_ids)
    end

end
