class Game
  attr_reader :winner

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = choose_starting_player
  end

  def choose_starting_player
    starting_player = rand(1..2)
    starting_player == 1 ? @player_one : @player_two
  end

  def check_lives
    @player_one.lives > 0 && @player_two.lives > 0
  end

  def winner
    @winner = @player_one.lives == 0 ? @player_two : @player_one
  end

  def switch_player
    @current_player = @current_player.id == @player_one.id ? @player_two : @player_one
  end

  def get_answer_from_player
    print '>> '
    player_answer = gets.chomp.to_i
  end

  def select_difficulty
    difficulty = nil
    loop do
      puts 'Please select a difficulty: 1. Easy, 2. Normal, 3. Hard'
      print '(type a number) >> '
      difficulty = gets.chomp.to_i
      break if [1,2,3].include?(difficulty)
      puts "That is not the correct input. Please try again."
      puts
    end
    @question = Question.new(difficulty)
  end

  def play_round
    # ----------NEW ROUND----------
    Message.new_round

    # Prompt player for answer
    puts @question.generate_question @current_player
    player_answer = get_answer_from_player

    # Check if answer correct
    answer_state = @question.check_answer player_answer
    Message.correct?(answer_state, @current_player)

    # Lose life is answer incorrect
    answer_state || @current_player.lose_life

    # Start a new round
    Message.lives_left(@player_one, @player_two)
    switch_player
  end
end