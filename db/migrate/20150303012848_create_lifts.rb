class CreateLifts < ActiveRecord::Migration
  def change
    create_table :lifts do |t|
      t.datetime :pickup_at
      t.datetime :dropoff_at
      t.decimal :distance
      t.string :status
      t.integer :lift_request_id, null: false
      t.integer :driver_id, null: false
      t.timestamps null: false
    end
  end
end
