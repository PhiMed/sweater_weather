class Background
  attr_reader :location,
              :img_url,
              :credit,
              :id

  def initialize(data, location)
    @id = nil
    @location = location
    @img_url = data[:urls][:regular]

    @credit = {
               :source => "unsplash.com",
               :author => data[:user][:name]
             }
  end
end
