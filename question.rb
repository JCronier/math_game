class Question
  def initialize difficulty
    @answer_to_current_question = 0
    @difficulty = 10**difficulty
  end

  def generate_question player
    first_number = rand(0...@difficulty)
    second_number = rand(0...@difficulty)
    @answer_to_current_question = first_number + second_number
    "Player #{player.id}: What does #{first_number} plus #{second_number} equal?"
  end

  def check_answer player_answer
    @answer_to_current_question == player_answer
  end
end