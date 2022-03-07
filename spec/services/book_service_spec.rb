require 'rails_helper'

RSpec.describe BookService do
  describe "methods" do
    it '#search_for_book' do
      location = 'denver, co'

      book_search = BookService.search_for_book(location)

      expect(book_search).to be_a(Hash)
    end
  end
end
