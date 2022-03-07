class Api::V1::ForecastController < ApplicationController
  def show
    if params[:location].present?
      forecast = ForecastFacade.get_forcast_for(params[:location])

      render(json: ForecastSerializer.new(forecast))
    else
      render(json: {data: {message: "Insufficent query parameters"}}, status: 400 )
    end
  end
end
