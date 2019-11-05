require 'rails_helper'

RSpec.describe 'Olympian Stats', type: :request do
  before(:each) do
    @team_1 = create(:team, name: 'Team 1')
    @team_2 = create(:team, name: 'Team 2')
    @team_3 = create(:team, name: 'Team 3')

    @sport_1 = create(:sport, name: 'Sport 1')
    @sport_2 = create(:sport, name: 'Sport 2')

    @olympian_1 = create(:olympian, name: 'Olympian 1', age: 20, sex: 'M', weight: 50, team: @team_1, sport: @sport_1 )
    @olympian_2 = create(:olympian, name: 'Olympian 2', age: 25, sex: 'M', weight: 55, team: @team_2, sport: @sport_2 )
    @olympian_3 = create(:olympian, name: 'Olympian 3', age: 30, sex: 'F', weight: 60, team: @team_3, sport: @sport_2 )
    @olympian_4 = create(:olympian, name: 'Olympian 4', age: 35, sex: 'M', weight: 65, team: @team_3, sport: @sport_1 )
    @olympian_5 = create(:olympian, name: 'Olympian 5', age: 40, sex: 'M', weight: 70, team: @team_2, sport: @sport_2 )
    @olympian_6 = create(:olympian, name: 'Olympian 6', age: 50, sex: 'F', weight: 75, team: @team_1, sport: @sport_2 )

    @event_1 = create(:event, name: 'Event 1', sport: @sport_1)
    @event_2 = create(:event, name: 'Event 2', sport: @sport_2)

    @olympian_event_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: 'Gold')
    @olympian_event_2 = create(:olympian_event, olympian: @olympian_2, event: @event_1, medal: 'Silver')
    @olympian_event_3 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: 'Bronze')
    @olympian_event_4 = create(:olympian_event, olympian: @olympian_3, event: @event_1, medal: 'Bronze')
    @olympian_event_5 = create(:olympian_event, olympian: @olympian_4, event: @event_2, medal: 'Silver')
    @olympian_event_6 = create(:olympian_event, olympian: @olympian_5, event: @event_2, medal: 'Gold')
    @olympian_event_7 = create(:olympian_event, olympian: @olympian_6, event: @event_2, medal: 'NA')
  end

  it 'returns the oldest Olympian with their medal count' do
    get '/api/v1/olympian_stats'

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(data[:olympian_stats].keys).to eq([:total_competing_olympians, :average_weight, :average_age])
  end
end
