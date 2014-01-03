class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :username, :null => false, :default => ""
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.datetime :dob
      t.string :age_group
      t.integer :city
      t.string :source

      t.timestamps
    end
    add_index :profiles, :username, :unique => true
  end
end
