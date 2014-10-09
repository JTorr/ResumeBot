class AddMasterToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :master, :boolean
  end
end
