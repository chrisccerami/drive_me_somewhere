class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :user_id, null: false
      t.string :license_number, null: false
      t.timestamps null: false
    end
  end
end
