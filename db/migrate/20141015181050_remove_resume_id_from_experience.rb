class RemoveResumeIdFromExperience < ActiveRecord::Migration
  def change
    remove_column :experiences, :resume_id
  end
end
