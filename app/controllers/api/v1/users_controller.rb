class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render(json: UserSerializer.new(User.find(user.id)), status: :created)
    else
      render json: { status: 400, message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
