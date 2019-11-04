FactoryBot.define do
  factory :olympian_event do
    medal_type = ['NA', 'gold', 'silver', 'bronze']
    
    medal { medal_type.sample }
    olympian { Faker::Name.name }
    event { Faker::Esport.event }
  end
end
