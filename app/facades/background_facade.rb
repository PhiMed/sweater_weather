class BackgroundFacade
  class << self
    def get_background(location)
      data = BackgroundService.get_background(location)
      Background.new(data)
    end
  end
end
