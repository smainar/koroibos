FactoryBot.define do
  factory :olympian_event do
    medal_type = ['NA', 'Gold', 'Silver', 'Bronze']

    medal { medal_type.sample }
    olympian { Faker::Name.name }
    event { Faker::Esport.event }
  end
end
