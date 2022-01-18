class BooksFacade
  class << self
    def aggregate(destination, quantity)
      book_data = BooksService.search(destination)
      data =
          {
            :destination => destination,
            :forecast => weather_hash(destination),
            :total_books_found => book_data[:numFound],
            :books => books(book_data, quantity)
          }
      Booksearch.new(data)
    end

    def books(book_data, quantity)
      if book_data[:docs].count > quantity.to_i
        books = (book_data[:docs].shift(quantity.to_i).map do |book|
                    Book.new(book)
                  end)
      else
        books = (book_data[:docs].map do |book|
                    Book.new(book)
                  end)
      end
    end

    def weather_hash(destination)
      forecast = ForecastFacade.get_forecast(destination)
      weather_hash = {
                      :summary => forecast.current_weather[:conditions],
                      :temperature => "#{forecast.current_weather[:temperature].round(0)} F"
                     }
      weather_hash
    end
  end
end
