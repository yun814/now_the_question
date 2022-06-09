class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer    :first_number_of_qusetions,       default: 0
      t.integer    :first_number_of_correct_answers, default: 0
      t.float      :first_correct_answer_rate,       default: 0
      t.integer    :all_number_of_qusetions,         default: 0
      t.integer    :all_number_of_correct_answers,   default: 0
      t.float      :all_correct_answer_rate,         default: 0
      t.references :user,                            null: false, foreign_key: true
      t.timestamps
    end
  end
end
