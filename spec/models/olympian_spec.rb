require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:events).through(:olympian_events) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_numericality_of(:age).is_greater_than(0) }
  end
end
