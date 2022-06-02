class Drill < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1, maximum: 20, message: "は20文字以内で入力してください"}
  validates :genre_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :informaiton, presence: true, length: {minimum: 5, maximum: 1000, message: "は5文字以上1000文字以内で入力してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
