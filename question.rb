class Question
  def initialize
    @answer_to_current_question = 0
    @player_answer = 0
  end

  def ask_question player
    number_one = rand(0..9)
    number_two = rand(0..9)
    @answer_to_current_question = number_one + number_two
    puts "Player #{player.id}: What does #{number_one} plus #{number_two} equal?"
  end

  def check_answer
    @answer_to_current_question == @player_answer
  end

  def get_answer_from_player
    @player_answer = gets.chomp.to_i
  end
end