FactoryBot.define do
  factory :sport do
    name { Faker::Team.sport }
  end
end
