class Api::ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    render "show.json.jb"
  end
end
