class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :cv, index: true
      t.string :institution
      t.string :area
      t.string :study_type
      t.date :start_date
      t.date :end_date
      t.decimal :gpa

      t.timestamps
    end
  end
end
