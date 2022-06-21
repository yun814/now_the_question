class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :num_of_favorites

  validates :nickname, presence: true, uniqueness: true
  has_many :drills
  has_many :quizzes
  has_many :results
  has_many :favorites
  has_many :comments
  has_one :record

  def self.search_by_user(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      return nil
    end
  end
end
