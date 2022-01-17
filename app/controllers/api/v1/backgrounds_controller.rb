class Api::V1::BackgroundController < ApplicationController
  def index
    background = BackgroundFacade.get_background(params[:location])

    render json: BackgroundSerializer.new(background)
  end

end
