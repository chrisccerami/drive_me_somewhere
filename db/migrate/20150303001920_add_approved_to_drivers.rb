class AddApprovedToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :approved, :boolean, default: false
  end
end
