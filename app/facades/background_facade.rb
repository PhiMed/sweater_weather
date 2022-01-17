class BackgroundFacade
  class << self
    def get_background(location)
      data = BackgroundService.get_background(location)[:results][0]
      Background.new(data, location)
    end
  end
end
