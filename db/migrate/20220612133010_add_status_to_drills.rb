class AddStatusToDrills < ActiveRecord::Migration[6.0]
  def change
    add_column :drills, :status, :integer, default: 0
  end
end
