class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.integer :lift_request_id, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.timestamps null: false
    end
  end
end
