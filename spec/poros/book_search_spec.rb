require 'rails_helper'

RSpec.describe Book do
  it 'exists' do
      attributes = {
                     :destination => "denver, co",
                     :forecast => {:summary => "overcast clouds", :temperature => "26.69 F"},
                     :total_books_found => 657,
                     :books =>
                                [isbn=["9780762507849", "0762507845"], publisher=["Universal Map Enterprises"], title="Denver, Co",
                                 isbn=["0607620056", "9780607620054"], publisher=["USGS Branch of Distribution"], title="Denver west, CO and Bailey, CO: Denver, CO",
                                 isbn=["9780607620047", "0607620048"], publisher=["USGS Branch of Distribution"], title="Denver East, CO and Castle Rock, CO: Denver, CO",
                                 isbn=["0883183668", "9780883183663"], publisher=["American Institute of Physics"], title="Photovoltaic safety, Denver, CO, 1988",
                                 isbn=["9781427401687", "1427401683"], publisher=["College Prowler"], title="University of Denver Co 2007"]}

      book_search = BookSearch.new(attributes)

      expect(book_search).to be_an_instance_of(BookSearch)
      expect(book_search.destination).to eq("denver, co")
      expect(book_search.forecast).to eq({:summary => "overcast clouds", :temperature => "26.69 F"})
      expect(book_search.total_books_found).to eq(657)
      expect(book_search.books).to be_an(Array)
  end
end
