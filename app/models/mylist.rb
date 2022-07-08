class Mylist < ApplicationRecord
  validates :title, presence: true

  has_many :mylist_drills, dependent: :destroy
  has_many :drills, through: :mylist_drills
  belongs_to :user
end
