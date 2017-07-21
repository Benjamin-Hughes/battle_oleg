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
    Game.start(Player.new(params[:player_1]), Player.new(params[:player_2]))
    p params
    redirect '/play'
  end

  get '/play' do
    redirect '/gameover' if Game.game.loser
    @player_1 = Game.game.player_1
    @player_2 = Game.game.player_2
    #{puts "Notifier = #{Game.game.notify}"}
    @commentator = Game.game.notify
    erb(:play)
  end

  get '/attack' do
    Game.game.attack
    redirect '/play'
  end

  get '/gameover' do
    @loser = Game.game.loser
    erb :gameover
  end

  run! if app_file == $0
end
