class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :cv, index: true
      t.string :company_name
      t.string :position
      t.date :start_date
      t.date :end_date
      t.text :summary

      t.timestamps
    end
  end
end
