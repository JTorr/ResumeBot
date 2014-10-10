class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column :skills, :cv_id, :resume_id
    rename_column :experiences, :cv_id, :resume_id
    rename_column :educations, :cv_id, :resume_id
  end
end
