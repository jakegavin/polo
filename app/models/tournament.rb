class Tournament < ActiveRecord::Base
  has_many :games, ->  { order("date ASC, time ASC") }

  validates :name, presence: true, uniqueness: true
end