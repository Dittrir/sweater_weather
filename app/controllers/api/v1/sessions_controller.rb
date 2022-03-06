class Api::V1::SessionsController < ApplicationController

  def create
    binding.pry
    user = User.find_by(email: params[:email])
    if user.save
      render(json: SessionSerializer.new(Session.find(user.id)), status: :created)
    else
      render json: { status: 400, message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end
end
