class Result < ApplicationRecord
  validates :times, presence: true
  validates :number_of_questions, presence: true
  validates :number_of_correct_answers, presence: true
  validates :correct_answer_rate, presence: true

  belongs_to :drill
  belongs_to :user
end
