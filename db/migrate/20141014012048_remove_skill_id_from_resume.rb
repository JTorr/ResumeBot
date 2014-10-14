class RemoveSkillIdFromResume < ActiveRecord::Migration
  def change
    remove_column :resumes, :skill_id
  end
end
