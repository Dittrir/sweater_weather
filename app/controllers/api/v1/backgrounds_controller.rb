class Api::V1::BackgroundsController < ApplicationController
  def show
    if params[:location].present?
      background = BackgroundFacade.get_background_for(params[:location])
      if background.nil?
        render(json: {data: {message: "There were no matches"}}, status: 200 )
      else
      render(json: BackgroundSerializer.new(background))
    end
    else
      render(json: {data: {message: "Insufficent query parameters"}}, status: 400 )
    end
  end
end
