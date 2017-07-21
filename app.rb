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
    redirect '/gameover' if $game.loser
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    puts "Notifier = #{$game.notify}"
    @commentator = $game.notify
    erb(:play)
  end

  get '/attack' do
    $game.attack
    redirect '/play'
  end

  get '/gameover' do
    @loser = $game.loser
    erb :gameover
  end

  run! if app_file == $0
end
