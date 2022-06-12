class Drill < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 20, message: 'は20文字以内で入力してください' }
  validate :add_error_genre_id
  validates :information, presence: true, length: { minimum: 1, maximum: 175, message: 'は175文字以内で入力してください' }

  has_many :quizzes, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  def add_error_genre_id
    errors[:base] << 'ジャンルを選択してください' if genre_id.blank?
  end
end
