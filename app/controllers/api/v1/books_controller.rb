class Api::V1::BooksController < ApplicationController
  def show
    if params[:quantity].to_i > 0
      book = BookFacade.search_for_book(params[:location], params[:quantity])
      render(json: BookSerializer.new(book))
    else
      render(json: {error: "Invalid Quantity"}, status: 400 )
    end
  end
end
