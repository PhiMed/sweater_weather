class Booksearch
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(data)
    @id = nil
    @destination = data[:destination]
    @forecast = data[:forecast]
  end

  def total_books_found

  end

  def books

  end
end
