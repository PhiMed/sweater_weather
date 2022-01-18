class BooksFacade
  class << self
    def aggregate(destination, quantity)
      forecast = ForecastFacade.get_forecast(destination)
      book_data = BooksearchService.search(destination)
      books = (
                          book_data[:docs].shift(quantity.to_i).map do |book|
                            Book.new(book)
                          end
                         )
      summary_hash = {
                      :summary => forecast.current_weather[:conditions],
                      :temperature => "#{forecast.current_weather[:temperature].round(0)} F"
                     }
      data =
          {
            :destination => destination,
            :forecast => summary_hash,
            :total_books_found => book_data[:numFound],
            :books => books
          }
      Booksearch.new(data)
    end
  end
end
