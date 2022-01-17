class BackgroundFacade
  class << self
    def get_background(location)
      data = BackgroundService.get_background(location)[:results][0]
      if data.nil?
        default_image = BackgroundService.get_background("pebbles")[:results][0]
        Background.new(default_image, location)
      else
        Background.new(data, location)
      end
    end
  end
end
