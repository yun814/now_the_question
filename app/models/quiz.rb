class Quiz < ApplicationRecord
  validates :question, presence: true, length: { minimum: 1, maximum: 112, message: 'は112文字以内で入力してください' }
  validates :choices_1, presence: true, length: { minimum: 1, maximum: 10, message: 'は10文字以内で入力してください' }
  validates :choices_2, presence: true, length: { minimum: 1, maximum: 10, message: 'は10文字以内で入力してください' }
  validates :choices_3, presence: true, length: { minimum: 1, maximum: 10, message: 'は10文字以内で入力してください' }
  validates :choices_4, presence: true, length: { minimum: 1, maximum: 10, message: 'は10文字以内で入力してください' }
  validates :correct_answer, presence: true,
                             numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4, message: 'は1から4の数字で入力してください' }

  belongs_to :drill
  belongs_to :user
end
