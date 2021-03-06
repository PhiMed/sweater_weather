class Api::V1::RoadtripsController < ApplicationController

  def create
    if roadtrip_params[:api_key].present? && User.where(api_key: (roadtrip_params[:api_key])).any?
      if params[:origin].present? && params[:destination].present?
        roadtrip = RoadtripFacade.aggregate(roadtrip_params[:origin], roadtrip_params[:destination])
        render json: RoadtripSerializer.new(roadtrip), status: 201
      else
        render json: {errors: {details: "Both origin and destination are required"}, status: 400}
      end
    else
      render json: {errors: {details: "Unauthorized - Valid API key required"}, status: 401}
    end
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
end
