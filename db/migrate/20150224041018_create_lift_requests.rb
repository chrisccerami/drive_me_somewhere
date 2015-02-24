class CreateLiftRequests < ActiveRecord::Migration
  def change
    create_table :lift_requests do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
