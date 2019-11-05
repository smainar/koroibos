require 'rails_helper'

RSpec.describe 'Olympians Index Page', type: :request do
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

    @olympian_event_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: 'Gold')
    @olympian_event_2 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: 'Silver')
    @olympian_event_3 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: 'Bronze')
  end

  it 'returns a list of all Olympians' do
    get '/api/v1/olympians'

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data.count).to eq(3)
    expect(data[0][:attributes].keys).to eq([:id, :name, :team, :age, :sport, :total_medals_won])
    expect(data[0][:attributes][:name]).to eq(@olympian_1.name)
    expect(data[1][:attributes][:name]).to eq(@olympian_2.name)
    expect(data[2][:attributes][:name]).to eq(@olympian_3.name)
  end
end
