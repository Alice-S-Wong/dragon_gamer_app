class Api::PokemonsController < ApplicationController
  def show
    @stats_array = []
    require 'http'
    response = HTTP.get("https://pokeapi.co/api/v2/pokemon/#{params[:pokemon]}")
    pokemon = response.parse
    pokemon["stats"].each do |stat|
      @stats_array << stat["base_stat"]
    end
    render "show.json.jb"
  end
end
