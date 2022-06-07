class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer    :times,                     null: false
      t.integer    :number_of_questions,       null: false
      t.integer    :number_of_correct_answers, null: false
      t.float      :correct_answer_rate,       null: false
      t.references :user,                      null: false, foreign_key: true
      t.references :drill,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
