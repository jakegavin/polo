class Coach < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name ,presence: true
  validates :email ,presence: true
  validates :title ,presence: true
  validates :bio ,presence: true
end