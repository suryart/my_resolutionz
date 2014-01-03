class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.text :description
      t.float :progress
      t.integer :user_id

      t.timestamps
    end
  end
end
