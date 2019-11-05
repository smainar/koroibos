class Api::V1::OlympianStatsController < ApplicationController
  def show
    render json: OlympianStatsSerializer.new.get_olympian_stats
  end
end
