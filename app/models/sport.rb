class Sport < ApplicationRecord
  has_many :olympians
  has_many :events

  validates_presence_of :name
end
