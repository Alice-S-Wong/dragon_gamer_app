class Api::ListItemsController < ApplicationController
  def create
    if current_user
      user_id = current_user.id
      list_type = params[:list_type]
      list = List.find_by(user_id: user_id, list_type: list_type)
      list_id = list.id
      list_item = ListItem.new(
        game_id: params[:game_id],
        list_id: list_id
      )
      list_item.save
      render json: {message: "List item has been added."}
    else
      render json: {message: "Must be logged in to add items to a list"}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      list_item = ListItem.find(params[:id])
      if current_user.id == list_item.list.user_id
        list_item.destroy
        render json: {message: "List item successfully deleted"}
      else
        render json: {message: "Unauthorized to delete list item"}, status: :unauthorized
      end
    else
      render json: {message: "Must be logged in to remove items from a list"}, status: :unauthorized
    end
  end
end
