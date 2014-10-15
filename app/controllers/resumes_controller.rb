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
    @master.update_attributes(title: "Master")
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
    skill_ids = params["skill_ids"].to_a
    @resume = current_user.resumes.new @master.attributes
    @resume.master = false
    @resume.id = (Resume.last.id + 1)
    @resume.save

    if @resume.save
      add_resume_skills(skill_ids)
      redirect_to @resume, notice: "Successful"
    else
      flash[:danger] = "Resume could not be saved."
      render :new
    end
  end

  def add_resume_skills(skill_ids)
    skill_ids.each do |id|
      @resume.skills << Skill.find(id)
    end
  end



  def index
    resumes = current_user.resumes.all
    @resumes = resumes.where(master: false)
  end

  def show
    @resume = current_user.resumes.find(params[:id])
  end

  def show_master
    @master = master_resume
    @skills = @master.skills || []
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
      params.permit(:title, :email, :phone_1, :phone_2, :phone_3, :address, :postal_code, :city, :state, skills: [])
    end

    def resume_params
      params.permit(skills: :skill_ids, title: :title)
    end

end
