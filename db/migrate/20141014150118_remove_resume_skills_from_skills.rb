class RemoveResumeSkillsFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :resume_skills_id
  end
end
