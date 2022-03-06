class BackgroundFacade
  def self.get_background_for(location)
    background = BackgroundService.get_background_for(coords[:lat], coords[:lng])

    Background.new(background, location)
  end
end
