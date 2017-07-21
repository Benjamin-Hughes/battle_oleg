require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  # get '/' do
  #   "Testing infrastructure working!"
  # end
enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    p params
    redirect '/play'
  end

  get '/play' do
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    @commentator = ""
    erb(:play)
  end

  get '/attack' do
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    @commentator = $game.notify
    $game.attack
    # erb(:attack)
    erb(:play)
  end

  run! if app_file == $0
end
