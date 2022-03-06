class Api::V1::BackgroundsController < ApplicationController
  def show
    BackgroundFacade.get_background_for(params[:location])
    render(json: BackgroundSerializer.new(forecast))
  end
end
