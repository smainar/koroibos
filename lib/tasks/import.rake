require 'csv'

namespace :import do
  desc 'Import Koroibos data from CSV file'

  task data: :environment do
    OlympianEvent.destroy_all
    Event.destroy_all
    Olympian.destroy_all
    Sport.destroy_all
    Team.destroy_all

    CSV.foreach('./data/koroibos.csv', headers: true, header_converters: :symbol) do |row|
      team = Team.find_or_create_by!(
        name: row[:team]
      )

      sport = Sport.find_or_create_by!(
        name: row[:sport]
      )

      olympian = Olympian.find_or_create_by!(
        name: row[:name],
        sex: row[:sex] == 'M' ? 0 : 1,
        age: row[:age],
        height: row[:height],
        weight: row[:weight],
        team_id: team.id,
        sport_id: sport.id
      )

      event = Event.find_or_create_by!(
        name: row[:event],
        sport_id: sport.id
      )

      olympian_event = OlympianEvent.find_or_create_by!(
        medal: get_medal_enum(row[:medal]),
        olympian_id: olympian.id,
        event_id: event.id
      )
    end

    puts "Loaded #{Team.count} teams."
    puts "Loaded #{Sport.count} sports."
    puts "Loaded #{Olympian.count} Olympians."
    puts "Loaded #{Event.count} events."
    puts "Loaded #{OlympianEvent.count} Olympian events."
  end
end

def get_medal_enum(medal)
  if 'NA'
    0
  elsif 'Gold'
    1
  elsif 'Silver'
    2
  else
    3
  end
end
