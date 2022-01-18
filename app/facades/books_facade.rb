class BooksFacade
  class << self
    def aggregate(destination, quantity)
      forecast = ForecastFacade.get_forecast(destination)
      weather_hash = {
                      :summary => forecast.current_weather[:conditions],
                      :temperature => "#{forecast.current_weather[:temperature].round(0)} F"
                     }
      book_data = BooksService.search(destination)
      books = (
                          book_data[:docs].shift(quantity.to_i).map do |book|
                            Book.new(book)
                          end
                         )
      data =
          {
            :destination => destination,
            :forecast => weather_hash,
            :total_books_found => book_data[:numFound],
            :books => books
          }
      Booksearch.new(data)
    end
  end
end
