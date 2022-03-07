class Api::V1::BooksController < ApplicationController
  def show
    book = BookFacade.search_for_book(params[:location], params[:quantity])
    render(json: BookSerializer.new(book))
  end
end
