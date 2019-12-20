class Api::GamesController < ApplicationController
  def index
    @games = Game.all
    render "index.json.jb"
  end
end
