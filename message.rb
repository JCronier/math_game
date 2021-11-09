class Message
  def self.end_game(player)
    puts '----------GAME OVER----------'
    puts "Player #{player.id} wins with a score of #{player.lives}/3!"
    puts "Goodbye! Thanks for playing."
  end

  def self.lives_left(player_one, player_two)
    puts "P1: #{player_one.lives}/3 vs P2: #{player_two.lives}/3"
    puts
  end

  def self.correct?(correct, player)
    correct ?
      puts("Player #{player.id}: Yes! You are correct.") :
      puts("Player #{player.id}: Seriously? No!")
  end

  def self.new_round
    puts '----------NEW ROUND----------'
  end
end