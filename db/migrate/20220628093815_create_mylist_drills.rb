class CreateMylistDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :mylist_drills do |t|
      t.references :mylist, null: false, foreign_key: true
      t.references :drill, null: false, foreign_key: true
      t.timestamps
    end
  end
end
