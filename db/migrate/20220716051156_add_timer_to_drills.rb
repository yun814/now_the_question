class AddTimerToDrills < ActiveRecord::Migration[6.0]
  def change
    add_column :drills, :timer, :integer, default: 0
  end
end
