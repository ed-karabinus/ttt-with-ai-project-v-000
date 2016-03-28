class Player::Human < Player
  def move(board)
    puts "#{self.token}, please enter your move as a number 1-9."
    gets.strip
  end
end