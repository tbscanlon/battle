class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @player_1_turn = false
  end

  def attack
    return player2.take_damage(10) if @player_1_turn
    player1.take_damage(10) unless @player_1_turn
  end

  def change_players
    @player_1_turn = !@player_1_turn
  end

  def player_1_turn?
    @player_1_turn
  end

end
