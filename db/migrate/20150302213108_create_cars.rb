class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :driver_id, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.string :year, null: false
      t.string :color, null: false
      t.string :license_plate, null: false
      t.timestamps null: false
    end
  end
end
