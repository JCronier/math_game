require './question'
require './game'
require './player'
require './message'

player_one = Player.new(1)
player_two = Player.new(2)
game = Game.new(player_one, player_two)

Message.welcome
game.select_difficulty

while game.check_lives
  game.play_round
end

Message.end_game(game.winner)