class RenameResumesToResumes < ActiveRecord::Migration
  def self.up
    rename_table :Resumes, :resumes
  end
  def self.down
    rename_table :resumes, :Resumes
  end
end
