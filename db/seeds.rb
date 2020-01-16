# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'net/https'
# http = Net::HTTP.new('api-v3.igdb.com',443)
# http.use_ssl = true
# request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/games'), {'user-key' => "#{ENV["API_KEY"]}"})
# request.body = "fields *; limit 20; offset 50; search \"Pokemon\";"
# @games = http.request(request).body
# @games = JSON[@games]

# @games.each do |game|
#   genres = game["genres"]
#   if genres
#     genres.each do |genre|
#       the_genre = Genre.find_by(api_id: genre)
#       the_game = Game.find_by(title: game["name"])
#       if the_genre && the_game
#         game_genre = GameGenre.new(genre_id: the_genre.id, game_id: the_game.id)
#         game_genre.save
#       end
#     end
#   end
#   # game1 = Game.new(
#   #   title: game["name"],
#   #   description: game["summary"],
#   #   api_id: game["id"]
#   # )
#   # game1.save
# end


# require 'net/https'
# http = Net::HTTP.new('api-v3.igdb.com',443)
# http.use_ssl = true
# request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/platforms'), {'user-key' => "#{ENV["API_KEY"]}"})
# request.body = "fields *; limit 50; offset: 150;"
# @platforms = http.request(request).body
# @platforms = JSON[@platforms]

# @platforms.each do |platform|
#   platform1 = Platform.new(
#     name: platform["name"],
#     api_id: platform["id"]
#   )
#   platform1.save
# end

# require 'net/https'
# http = Net::HTTP.new('api-v3.igdb.com',443)
# http.use_ssl = true
# request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/games'), {'user-key' => "#{ENV["API_KEY"]}"})
# request.body = "fields *; limit 50; offset 50; search \"Pokemon\";"
# @games = http.request(request).body
# @games = JSON[@games]

# @games.each do |game|
#   platforms = game["platforms"]
#   if platforms
#     platforms.each do |platform|
#       the_platform = Platform.find_by(api_id: platform)
#       the_game = Game.find_by(title: game["name"])
#       if the_platform && the_game
#         game_platform = GamePlatform.new(platform_id: the_platform.id, game_id: the_game.id)
#         game_platform.save
#       end
#     end
#   end
#   # game1 = Game.new(
#   #   title: game["name"],
#   #   description: game["summary"],
#   #   api_id: game["id"]
#   # )
#   # game1.save
# end

require 'net/https'
http = Net::HTTP.new('api-v3.igdb.com',443)
http.use_ssl = true
request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/games'), {'user-key' => "#{ENV["API_KEY"]}"})
request.body = "fields *; limit 50; offset 50; search \"Pokemon\";"
@games = http.request(request).body
@games = JSON[@games]

@games.each do |game|
  cover = game["cover"]
  require 'net/https'
  http = Net::HTTP.new('api-v3.igdb.com',443)
  http.use_ssl = true
  request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/covers'), {'user-key' => "#{ENV["API_KEY"]}"})
  request.body = "fields *; where id = #{cover};"
  @cover = http.request(request).body
  @cover = JSON[@cover]
  the_cover = @cover[0]["url"]
  the_game = Game.find_by(api_id: game["id"])
  if the_game
    the_game.image_url = the_cover
    the_game.save
  end
end