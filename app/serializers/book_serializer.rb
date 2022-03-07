class BookSerializer
  include JSONAPI::Serializer
  set_type :id
  set_type "books"
  attributes :destination,
             :forecast,
             :total_books_found,
             :books
end
