class CreateResumeEducations < ActiveRecord::Migration
  def change
    create_table :resume_educations do |t|
      t.references :resume, index: true
      t.references :education, index: true

      t.timestamps
    end
  end
end
