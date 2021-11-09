require './question'
require './game'
require './player'
require './message'

player_one = Player.new(1)
player_two = Player.new(2)

starting_player = rand(1..2)

game = Game.new(starting_player == 1 ? player_one : player_two)

question = Question.new

while game.check_lives(player_one, player_two)
  # ----------NEW ROUND----------
  Message.new_round

  # Prompt player for answer
  question.ask_question game.current_player
  question.get_answer_from_player

  # Check if answer correct
  answer_state = question.check_answer
  Message.correct?(answer_state, game.current_player)

  # Lose life is answer incorrect
  answer_state || game.current_player.lose_life

  # Start a new round
  Message.lives_left(player_one, player_two)
  game.switch_player(player_one, player_two)
end

winner = game.winner(player_one, player_two)
Message.end_game(winner)