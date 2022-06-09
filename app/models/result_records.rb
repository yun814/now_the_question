class ResultRecords
  include ActiveModel::Model
  attr_accessor :times, :number_of_questions, :number_of_correct_answers, :correct_answer_rate, :user_id, :drill_id,
                :first_number_of_questions, :first_number_of_correct_answers, :first_correct_answer_rate, :all_number_of_questions, :all_number_of_correct_answers, :all_correct_answer_rate
  
  def save
    Result.create(times: times, number_of_questions: number_of_questions, number_of_correct_answers: number_of_correct_answers, correct_answer_rate: correct_answer_rate, user_id: user_id, drill_id: drill_id)
    record = Record.find_by(user_id: user_id)
    record.update(record_hash)
  end

  private
  def record_hash
    user = User.find(user_id)
    first_number_of_questions = user.results.where(times: 1).sum(:number_of_questions)
    first_number_of_correct_answers = user.results.where(times: 1).sum(:number_of_correct_answers)
    first_correct_answer_rate = (first_number_of_correct_answers.to_f / first_number_of_questions.to_f) * 100
    all_number_of_questions = user.results.sum(:number_of_questions)
    all_number_of_correct_answers = user.results.sum(:number_of_correct_answers)
    all_correct_answer_rate = (all_number_of_correct_answers.to_f / all_number_of_questions.to_f) * 100
    record_hash = {
      first_number_of_questions: first_number_of_questions,
      first_number_of_correct_answers: first_number_of_correct_answers,
      first_correct_answer_rate: first_correct_answer_rate,
      all_number_of_questions: all_number_of_questions,
      all_number_of_correct_answers: all_number_of_correct_answers,
      all_correct_answer_rate: all_correct_answer_rate
    }
  end
end