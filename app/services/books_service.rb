class BooksService
  class << self
    def conn
      conn = Faraday.new(url: 'https://openlibrary.org')
    end

    def search(location)
      response = conn.get("/search.json?q=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
