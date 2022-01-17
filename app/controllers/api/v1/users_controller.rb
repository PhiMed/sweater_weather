class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(User.find(user.id)), status: 201
    else
      messages = user.errors.messages.to_s.delete! '[]"{}:'
      render json: {errors: {details: "#{messages}"}, status: 400}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
