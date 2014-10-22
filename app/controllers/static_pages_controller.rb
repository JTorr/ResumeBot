class StaticPagesController < ApplicationController
  def home
    if current_user && (current_user.resumes.count > 0)
      # flash[:success] = "Welcome"
    elsif current_user
      redirect_to new_resume_url
    end
  end
end
