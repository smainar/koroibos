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

  describe 'instance methods' do
    describe '#total_medals_won' do
      it 'returns all Olympians with the number of medals won' do
        team_1 = create(:team, name: 'Team 1')
        team_2 = create(:team, name: 'Team 2')
        team_3 = create(:team, name: 'Team 3')

        sport_1 = create(:sport, name: 'Sport 1')
        sport_2 = create(:sport, name: 'Sport 2')

        olympian_1 = create(:olympian, name: 'Olympian 1', age: 20, sex: 'M', team: team_1, sport: sport_1 )
        olympian_2 = create(:olympian, name: 'Olympian 2', age: 25, sex: 'M', team: team_2, sport: sport_2 )
        olympian_3 = create(:olympian, name: 'Olympian 3', age: 30, sex: 'F', team: team_3, sport: sport_2 )

        event_1 = create(:event, name: 'Event 1', sport: sport_1)
        event_2 = create(:event, name: 'Event 2', sport: sport_2)
        event_3 = create(:event, name: 'Event 3', sport: sport_2)

        olympian_event_1 = create(:olympian_event, olympian: olympian_1, event: event_1, medal: 'Gold')
        olympian_event_2 = create(:olympian_event, olympian: olympian_2, event: event_2, medal: 'Silver')
        olympian_event_3 = create(:olympian_event, olympian: olympian_2, event: event_3, medal: 'Bronze')
        olympian_event_3 = create(:olympian_event, olympian: olympian_3, event: event_2, medal: 'NA')

        expect(olympian_1.total_medals_won).to eq(1)
        expect(olympian_2.total_medals_won).to eq(2)
        expect(olympian_3.total_medals_won).to eq(0)
      end
    end
  end

  describe 'class methods' do
    before(:each) do
      @team_1 = create(:team, name: 'Team 1')
      @team_2 = create(:team, name: 'Team 2')
      @team_3 = create(:team, name: 'Team 3')

      @sport_1 = create(:sport, name: 'Sport 1')
      @sport_2 = create(:sport, name: 'Sport 2')

      @olympian_1 = create(:olympian, name: 'Olympian 1', age: 20, sex: 'M', team: @team_1, sport: @sport_1 )
      @olympian_2 = create(:olympian, name: 'Olympian 2', age: 25, sex: 'M', team: @team_2, sport: @sport_2 )
      @olympian_3 = create(:olympian, name: 'Olympian 3', age: 30, sex: 'F', team: @team_3, sport: @sport_2 )

      @event_1 = create(:event, name: 'Event 1', sport: @sport_1)
      @event_2 = create(:event, name: 'Event 2', sport: @sport_2)
      @event_3 = create(:event, name: 'Event 3', sport: @sport_2)

      @olympian_event_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: 'Gold')
      @olympian_event_2 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: 'Silver')
      @olympian_event_3 = create(:olympian_event, olympian: @olympian_2, event: @event_3, medal: 'Bronze')
      @olympian_event_3 = create(:olympian_event, olympian: @olympian_3, event: @event_2, medal: 'NA')
    end

    describe '::youngest_age' do
      it 'returns returns the youngest Olympian' do
        expect(Olympian.youngest_age).to eq(@olympian_1)
      end
    end

    describe '::oldest_age' do
      it 'returns returns the youngest Olympian' do
        expect(Olympian.oldest_age).to eq(@olympian_3)
      end
    end
  end
end
