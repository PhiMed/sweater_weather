class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(User.find(user.id)), status: 201
    else
      render json: {errors: {details: "Error: Invalid credentials"}}, status: 400
    end
  end
end
