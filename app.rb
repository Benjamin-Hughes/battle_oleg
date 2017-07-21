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
    redirect '/gameover' if $game.player_1.points <= 0 || $game.player_2.points <= 0

    # erb(:attack)
    erb(:play)
  end

  get '/gameover' do
    if $game.player_1.points <= 0
      @loser = $game.player_1
    else
      @loser = $game.player_2
    end
    erb :gameover
  end

  run! if app_file == $0
end
