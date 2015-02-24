class RemoveNullFalseFromOriginAndDestinationForeignKeys < ActiveRecord::Migration
  def up
    change_column :origins, :lift_request_id, :integer, null: true
    change_column :destinations, :lift_request_id, :integer, null: true
  end

  def down
    change_column :origins, :lift_request_id, :integer, null: false
    change_column :destinations, :lift_request_id, :integer, null: false
  end
end
