class Mylist < ApplicationRecord
  validates :title, presence: true

  has_many :mylist_drills
  has_many :drills, through: :mylist_drills
end
