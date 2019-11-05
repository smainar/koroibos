class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :team, :age, :sport

  attribute :total_medals_won do |object|
    object.total_medals_won
  end
end
