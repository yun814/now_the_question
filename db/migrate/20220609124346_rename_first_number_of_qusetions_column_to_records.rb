class RenameFirstNumberOfQusetionsColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :first_number_of_qusetions, :first_number_of_questions
    rename_column :records, :all_number_of_qusetions, :all_number_of_questions
  end
end
