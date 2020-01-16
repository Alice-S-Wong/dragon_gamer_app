class Api::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end  

  def show
    if current_user
      @user = User.find_by(id: current_user.id)
      render "show.json.jb"
    end
  end

  # def update
  #   if current_user.id == params[:id]
  #     user = current_user
  #     p user
  #   else
  #     render json: "Unauthorized to update user info.", status: :unauthorized
  #   end
  # end
end
