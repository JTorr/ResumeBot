class CreateResumes < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.references :user
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_1
      t.string :phone_2
      t.string :phone_3
      t.string :address
      t.integer :postal_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
