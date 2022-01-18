class BooksearchFacade
  class << self
    def aggregate(destination)
      forecast = ForecastFacade.get_forecast(destination)
      book_data = BooksearchService.search(destination)
      first_five_books = (
                          book_data[:docs].shift(5).map do |book|
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
            :books => first_five_books
          }
      Booksearch.new(data)
    end
  end
end
