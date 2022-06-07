class Drill < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1, maximum: 20, message: "は20文字以内で入力してください"}
  validates :genre_id, numericality: {other_than: 0, message: "を選択してください"}
  validates :information, presence: true, length: {minimum: 1, maximum: 175, message: "は175文字以内で入力してください"}

  has_many :quizzes
  has_many :results
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :quizzes
end
