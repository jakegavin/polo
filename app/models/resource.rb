class Resource < ActiveRecord::Base
  validates :filename, uniqueness: true
  validates :name, uniqueness: true
end