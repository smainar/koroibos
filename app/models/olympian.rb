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

  def self.youngest_age
    self.where(age: minimum(:age)).take
  end

  def self.oldest_age
    self.where(age: maximum(:age)).take
  end

  def self.average_age
    self.average(:age)
  end

  def self.average_weight_females
    self.where(sex: 'F').average(:weight)
  end

  def self.average_weight_males
    self.where(sex: 'M').average(:weight)
  end

  def self.total_competing_olympians
    self.count
  end
end
