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

  def loser
    @players.select { |player| player.points <= 0 }.last
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
    if game_started?
      @player_1_turn ? "#{player_2.name} attacked #{player_1.name}!!!"
      : "#{player_1.name} attacked #{player_2.name}!!!"
    end
  end

  private

  def game_started?
    player_1.points < player_1.default_points || player_2.points < player_2.default_points
  end
end
