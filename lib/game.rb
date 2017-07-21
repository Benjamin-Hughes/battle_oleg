require_relative 'player'

class Game
  attr_accessor :player_1_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @player_1_turn = true
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack
    if @player_1_turn == true
      @player_1_turn = false
      player_2.reduce_points
    else
      @player_1_turn = true
      player_1.reduce_points
    end
  end

  def notify
    @player_1_turn ? "#{player_1.name} attacked #{player_2.name}!!!" : "#{player_2.name} attacked #{player_1.name}!!!"
  end
end
