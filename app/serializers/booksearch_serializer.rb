class BooksearchSerializer
  include JSONAPI::Serializer
  attributes  :destination,
              :forecast,
              :total_books_found,
              :books

end
