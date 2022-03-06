class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.get_forcast_for(params[:location])
    render(json: ForecastSerializer.new(forecast))
  end
end
