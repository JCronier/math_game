class Game
  def initialize player
    @current_player = player
  end

  def check_lives(player_one, player_two)
    player_one.lives > 0 && player_two.lives > 0
  end

  def winner(player_one, player_two)
    player_one.lives == 0 ? player_two : player_one
  end

  def switch_player(player_one, player_two)
    @current_player = @current_player.id == player_one.id ? player_two : player_one
  end

  attr_reader :current_player
end