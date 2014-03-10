class Team < ActiveRecord::Base
  has_many :players
  has_many :games

  validates :name, presence: true
end