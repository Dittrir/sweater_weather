class BackgroundFacade
  def self.get_background_for(location)
    background = BackgroundService.get_background_for(location)
    if background[:total] > 0
      Background.new(background, location)
    end
  end
end
