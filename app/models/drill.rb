class Drill < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1, maximum: 20, message: "は20文字以内で入力してください"}
  validates :genre_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :information, presence: true, length: {minimum: 1, maximum: 1000, message: "は1文字以上1000文字以内で入力してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :quizzes
end
