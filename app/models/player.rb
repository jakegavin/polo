class Player < ActiveRecord::Base
  belongs_to :team

  validates :first_name, presence: true
end