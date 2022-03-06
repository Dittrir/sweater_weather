class Api::V1::RoadTripsController < ApplicationController

  def create
    if road_trip_params[:origin] && road_trip_params[:destination]
      road_trip = RoadTripFacade.new_trip(road_trip_params[:origin], road_trip_params[:destination])
      render(json: RoadTripSerializer.new(road_trip), status: :created)
    else
      render(json: {error: "Origin and Destination are Required."}, status: 401 )
    end
  end

  private
    def road_trip_params
      params.permit(:origin, :destination, :api_key)
    end
  end
