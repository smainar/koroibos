class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age] == 'youngest'
      render json: OlympianSerializer.new(Olympian.youngest_age)
    else
      render json: OlympianSerializer.new(Olympian.all)
    end
  end
end
