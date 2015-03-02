class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :driver_id, null: false
      t.integer :score, null: false
      t.string :comment
      t.timestamps null: false
    end
  end
end
