FactoryBot.define do
  factory :olympian do
    name { Faker::Name.name }
    sex { Faker::Gender.binary_type }
    age { Faker::Number.number(digits: 2) }
    height { Faker::Number.between(from: 147, to: 202) }
    weight { Faker::Number.between(from: 49, to: 150) }
    team { Faker::Address.country }
    sport { Faker::Team.sport }
  end
end
