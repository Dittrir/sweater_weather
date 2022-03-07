require 'rails_helper'

RSpec.describe BookFacade, type: :facade do
  context 'class methods' do
    describe 'closest_alt_fuel_info' do
      it 'returns alt fuel station info' do
        book_search = BookFacade.search_for_book('denver, co', 5)

        expect(book_search).to be_a(BookSearch)
      end

      # it 'returns alt fuel station info' do
      #   station = BookFacade.book_search('3624 Kansas St, Bellingham, WA, 98229', 'ELEC', 1).first
      #
      #   station_route = BookFacade.search_route('3624 Kansas St, Bellingham, WA, 98229', station.location)
      #
      #   expect(station_route).to be_a(Route)
      # end
    end
  end
end
