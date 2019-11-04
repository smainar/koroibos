class Event < ApplicationRecord
  belongs_to :sport

  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  validates_presence_of :name
end
