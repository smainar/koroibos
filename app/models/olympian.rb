class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport

  has_many :olympian_events
  has_many :events, through: :olympian_events

  validates_presence_of :name

  validates :age, presence: true, numericality: {
    only_integer: true,
    greater_than: 0
  }

  enum sex: ['M', 'F']

  def total_medals_won
    self.olympian_events.where.not(medal: 0).count
  end
end
