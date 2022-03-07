require 'rails_helper'

RSpec.describe 'The open library API' do
  describe "returns query results" do
    it 'happy path' do
      location = "denver, co"
      quantity = 5

      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful

      book_search = JSON.parse(response.body, symbolize_names: true)
      book_search_data = book_search[:data]

      expect(book_search_data).to have_key(:id)
      expect(book_search_data[:id]).to eq(nil)

      expect(book_search_data[:attributes]).to have_key(:destination)
      expect(book_search_data[:attributes][:destination]).to be_a(String)

      expect(book_search_data[:attributes]).to have_key(:forecast)
      expect(book_search_data[:attributes][:forecast]).to be_a(Hash)

      expect(book_search_data[:attributes][:forecast]).to have_key(:summary)
      expect(book_search_data[:attributes][:forecast][:summary]).to be_a(String)

      expect(book_search_data[:attributes][:forecast]).to have_key(:temperature)
      expect(book_search_data[:attributes][:forecast][:temperature]).to be_a(String)

      expect(book_search_data[:attributes]).to have_key(:total_books_found)
      expect(book_search_data[:attributes][:total_books_found]).to be_a(Integer)

      expect(book_search_data[:attributes]).to have_key(:books)
      expect(book_search_data[:attributes][:books]).to be_a(Array)
    end
  end
end
