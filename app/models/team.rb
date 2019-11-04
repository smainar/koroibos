class Team < ApplicationRecord
  has_many :olympians

  validates_presence_of :name
end
