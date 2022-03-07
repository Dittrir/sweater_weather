require 'rails_helper'

RSpec.describe BookFacade, type: :facade do
  context 'book search' do
    describe 'class methods' do
      it '#search_for_book' do
        book_search = BookFacade.search_for_book('denver, co', 5)

        expect(book_search).to be_a(BookSearch)
      end

      it '#weather_at' do
        location = 'denver, co'
        destination_forecast = BookFacade.weather_at(location)

        expect(destination_forecast).to be_a(Hash)
      end
    end
  end
end
