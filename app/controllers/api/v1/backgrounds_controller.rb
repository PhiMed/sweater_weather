class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundFacade.get_background(params[:location])
    
    render json: BackgroundSerializer.new(background)
  end

end
