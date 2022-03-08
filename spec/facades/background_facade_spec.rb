require 'rails_helper'

RSpec.describe BackgroundFacade, type: :facade do
  context 'class methods' do
    it '#get_background_for', :vcr do
      location = "Bellingham, WA"

      background = BackgroundFacade.get_background_for(location)

      expect(background).to be_a(Background)
    end
  end
end
