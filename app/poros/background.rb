class Background
  attr_reader :location,
              :img_url,
              :source,
              :author

  def initialize(data)
    @location = data[:attributes][:location]
    @img_url = data[:attributes][:img_url]
    @source = data[:attributes][:source]
    @author = data[:attributes][:author]
  end
end
