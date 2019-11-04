FactoryBot.define do
  factory :event do
    name { Faker::Esport.event }
    sport { Faker::Team.sport }
  end
end
