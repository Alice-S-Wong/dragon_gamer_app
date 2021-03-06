class Api::ListsController < ApplicationController
  def index
    @lists = List.where(visibility: "public")
    render "index.json.jb"
  end

  def private
    if current_user
      user = User.find_by(id: current_user.id)
      @lists = List.where(user_id: user.id, visibility: "private")
      render "private.json.jb"
    end
  end

  def create
    if current_user
      @list = List.new(
        user_id: current_user.id,
        list_type: params[:list_type],
        visibility: params[:visibility],
      )
      if @list.save
        render "show.json.jb"
      else
        render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Must be logged in to create a list"}, status: :unauthorized
    end
  end
  def show
    @list = List.find(params[:id])
    render "show.json.jb"
  end
end
