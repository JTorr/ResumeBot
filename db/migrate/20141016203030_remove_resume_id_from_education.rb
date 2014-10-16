class RemoveResumeIdFromEducation < ActiveRecord::Migration
  def change
    remove_column :educations, :resume_id
  end
end
