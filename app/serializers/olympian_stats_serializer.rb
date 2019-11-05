class OlympianStatsSerializer
  def get_olympian_stats
    {
    "olympian_stats": {
      "total_competing_olympians": Olympian.total_competing_olympians,
      "average_weight": {
        "unit": "kg",
        "male_olympians": Olympian.average_weight_males.round(1),
        "female_olympians": Olympian.average_weight_females.round(1)
      },
      "average_age": Olympian.average_age.round(1)
    }
  }
  end
end
