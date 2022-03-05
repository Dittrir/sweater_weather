require 'rails_helper'

RSpec.describe MapQuestService do
  describe "methods" do
    it '#get_lat_long_for' do
      location = '3624 Kansas St, Bellingham, WA, 98229'

      lat_long = MapQuestService.get_lat_long_for(location)

      expect(lat_long).to be_a(Hash)
    end
  end
end
