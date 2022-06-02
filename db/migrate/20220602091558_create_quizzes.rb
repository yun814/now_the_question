class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text       :question,       null: false
      t.string     :choices_1,      null: false
      t.string     :choices_2,      null: false
      t.string     :choices_3,      null: false
      t.string     :choices_4,      null: false
      t.integer    :correct_answer, null: false
      t.references :drill,          null: false, foreign_key: true
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
