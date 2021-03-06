class TicTacToeCLI
  def initialize
  end

  def call
    puts 'Hello, user!'
    puts 'Would you like to play a 0-, 1-, or 2-player game?'
    puts 'Use number only to select (e.g. 0, 1, 2).'

    input = gets.strip.to_i

    case input
      when 0
        Game.new(Player::Computer.new('X'), Player::Computer.new('O')).play
      when 1
        puts 'Player, what should your token be? (Must be one character.)'
        human_token = gets.strip
        puts 'And what should the computer opponent\'s token be? (Must also be one character.)'
        computer_token = gets.strip
        puts 'Would you like to take the first move against the computer? (Y/n)'
        if gets.strip.upcase == 'N'
          Game.new(Player::Computer.new(computer_token), Player::Human.new(human_token)).play
        else
          Game.new(Player::Human.new(human_token), Player::Computer.new(computer_token)).play
        end
      when 2
        puts 'Player 1, what should your token be? (Must be one character.)'
        player_1_token = gets.strip
        puts 'Player 2, what should your token be? (Must also be one character.)'
        player_2_token = gets.strip
        Game.new(Player::Human.new(player_1_token), Player::Human.new(player_2_token)).play
    end

    puts 'Would you like the computer to play a random opponent 100 times and report the number of losses? (Y/n)'
    if gets.strip.upcase == 'N'
    else
      puts 'Even though X customarily goes first, in the following games the computer'
      puts 'will be X even when it does not take the first turn. This is for'
      puts 'demonstration purposes, so that the random opponent is always O.'
      losses = (0..99).collect do |i|
        if i.even?
          Game.new(Player::Computer.new('X'), Player::Random.new('O')).play
        else
          Game.new(Player::Random.new('O'), Player::Computer.new('X')).play
        end
      end.count { |token| token == 'O' }
      puts 'The computer played a random opponent 100 times and lost ' + losses.to_s + ' times. Goodbye!'
    end
  end
end