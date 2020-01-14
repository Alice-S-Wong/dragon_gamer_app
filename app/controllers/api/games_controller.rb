class Api::GamesController < ApplicationController
  def index
    # require 'net/https'
    # http = Net::HTTP.new('api-v3.igdb.com',443)
    # http.use_ssl = true
    # request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/games'), {'user-key' => "#{ENV["API_KEY"]}"})
    # request.body = "fields *; limit 50; search \"#{params[:search]}\";"
    # @games = http.request(request).body
    # @games = JSON[@games]
    @games = Game.all
    render "index.json.jb"
  end
  def show
    @game = Game.find(params[:id])
    render "show.json.jb"
  end
end
