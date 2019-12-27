class Api::GamesController < ApplicationController
  def index
    # p "*" * 50
    # p current_user
    # p "*" * 50
    @games = Game.all
    render "index.json.jb"
  end
  def show
    @game = Game.find(params[:id])
    render "show.json.jb"
  end
end
