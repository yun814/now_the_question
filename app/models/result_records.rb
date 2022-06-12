class ResultRecords
  include ActiveModel::Model
  attr_accessor :times, :number_of_questions, :number_of_correct_answers, :correct_answer_rate, :user_id, :drill_id,
                :first_number_of_questions, :first_number_of_correct_answers, :first_correct_answer_rate, :all_number_of_questions, :all_number_of_correct_answers, :all_correct_answer_rate

  validates :times, presence: true
  validate :add_error_times
  validates :number_of_questions, presence: true
  validates :number_of_correct_answers, presence: true
  validates :correct_answer_rate, presence: true

  def save
    Result.create(times: times, number_of_questions: number_of_questions, number_of_correct_answers: number_of_correct_answers,
                  correct_answer_rate: correct_answer_rate, user_id: user_id, drill_id: drill_id)
    record = Record.find_by(user_id: user_id)
    record.update(record_hash)
  end

  private

  def record_hash
    user = User.find(user_id)

    if times == '1'
      first_number_of_questions = user.record.first_number_of_questions + number_of_questions.to_i
      first_number_of_correct_answers = user.record.first_number_of_correct_answers + number_of_correct_answers.to_i
      first_correct_answer_rate = (first_number_of_correct_answers.to_f / first_number_of_questions.to_f) * 100
      all_number_of_questions = user.record.all_number_of_questions + number_of_questions.to_i
      all_number_of_correct_answers = user.record.all_number_of_correct_answers + number_of_correct_answers.to_i
      all_correct_answer_rate = (all_number_of_correct_answers.to_f / all_number_of_questions.to_f) * 100
      record_hash = {
        first_number_of_questions: first_number_of_questions,
        first_number_of_correct_answers: first_number_of_correct_answers,
        first_correct_answer_rate: first_correct_answer_rate,
        all_number_of_questions: all_number_of_questions,
        all_number_of_correct_answers: all_number_of_correct_answers,
        all_correct_answer_rate: all_correct_answer_rate
      }
    else
      first_number_of_questions = user.record.first_number_of_questions
      first_number_of_correct_answers = user.record.first_number_of_correct_answers
      first_correct_answer_rate = user.record.first_correct_answer_rate
      all_number_of_questions = user.record.all_number_of_questions + number_of_questions.to_i
      all_number_of_correct_answers = user.record.all_number_of_correct_answers + number_of_correct_answers.to_i
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

  def add_error_times
    errors[:base] << '不正な回答です。' if Result.find_by(user_id: user_id, drill_id: drill_id, times: times)
  end
end
