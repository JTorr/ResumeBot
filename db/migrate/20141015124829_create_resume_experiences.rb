class CreateResumeExperiences < ActiveRecord::Migration
  def change
    create_table :resume_experiences do |t|
    t.references :resume, index: true
    t.references :experience, index: true

      t.timestamps
    end
  end
end
