require 'rails_helper'

RSpec.describe BackgroundService do
  describe "methods" do
    it '#get_background_for', :vcr do
      location = "Bellingham, WA"

      background = BackgroundService.get_background_for(location)

      expect(background).to be_a(Hash)
    end
  end
end
