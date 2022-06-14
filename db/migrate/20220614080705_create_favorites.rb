class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :drill, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :drill_id], unique: true
    end
  end
end
