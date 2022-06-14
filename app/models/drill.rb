class Drill < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 20, message: 'は20文字以内で入力してください' }
  validate :add_error_genre_id
  validates :information, presence: true, length: { minimum: 1, maximum: 175, message: 'は175文字以内で入力してください' }

  has_many :quizzes, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  def add_error_genre_id
    errors[:base] << 'ジャンルを選択してください' if genre_id.blank?
  end

  def self.search_by_title(search)
    if search != ""
      Drill.where('title LIKE(?)', "%#{search}%").order(updated_at: "DESC")
    else
      Drill.all.order(updated_at: 'DESC')
    end
  end

  def self.search_by_info(search)
    if search != ""
      Drill.where('information LIKE(?)', "%#{search}%").order(updated_at: "DESC")
    else
      return nil
    end
  end
end
