class ResumesController < ApplicationController
  def new
    if current_user.resumes.where(master: true).empty?
      redirect_to :welcome
    else
      @master = master_resume
      @resume = current_user.resumes.new
    end
  end

  def new_master
    @master = current_user.resumes.new
  end

  def create_master
    @master = current_user.resumes.create new_master_params
    @master.update_attributes(master: true)
    # binding.pry
    if @master.save
      redirect_to master_path, notice: "Successful"
    else
      flash[:danger] = "Resume could not be saved."
      render :new_master
    end
  end

  def create
    @master = master_resume
    @skills = params["skill_ids"].to_a
    @new_atts = @master.attributes.merge(skills: @skills)
    @new_atts.delete(:id, :master)
    # binding.pry

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
    @master = master_resume
    @skills = @master.resume_skills || []
    unless @master
      redirect_to welcome_path
    end
  end

  def edit_master
    @master = master_resume
  end

  def update_master
    @master = master_resume
    @master.update_attributes new_resume_params
    @master.save!
    head :ok
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

    def new_master_params
      params.permit(:first_name, :last_name, :email, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state)
    end


    def new_resume_params
      params.permit(:email, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state, skills: [])
    end

    def resume_params
      params.permit(skills: :skill_ids)
    end

end
