FactoryBot.define do
  factory :team do
    name { Faker::Address.country }
  end
end
