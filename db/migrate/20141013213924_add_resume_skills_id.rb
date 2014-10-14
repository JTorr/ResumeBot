class AddResumeSkillsId < ActiveRecord::Migration
  def change
    rename_column :skills, :resume_id, :resume_skills_id
    add_column :resumes, :skill_id, :integer
  end
end
