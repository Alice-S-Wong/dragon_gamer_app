class Api::ListsController < ApplicationController
  def create
    if current_user
      @list = List.new(
        user_id: current_user.id,
        list_type: params[:list_type],
        visibility: params[:visibility],
      )
      @list.save
      render "show.json.jb"
    else
      render json: {message: "Must be logged in to create a list"}, status: :unauthorized
    end
  end
  def show
    @list = List.find(params[:id])
    render "show.json.jb"
  end
end
