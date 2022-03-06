class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user == nil
      render(json: {error: "User does not exist."}, status: 401 )
    elsif user.authenticate(params[:password])
      render(json: SessionSerializer.new(Session.find(user.id)), status: :created)
    else
      render(json: {error: "Email or password is incorrect. Please try again."}, status: 401 )
      redirect_to "/login"
    end
  end
end
