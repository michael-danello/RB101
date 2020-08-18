INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9]] +
                [[1,4,7],[2,5,8],[3,6,9]] +
                [[1,5,9],[3,5,7]]


def display_board(board)
system "clear"
puts "     |     |"
puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
puts "     |     |"
puts ""
end

def prompt(message)
  puts  "#{message} =>"
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def joinor(arr, joiner=", ", endword = "or")
  joined = arr[0..-2].join(joiner)
  joined + " #{endword} " + arr[-1].to_s
end

def empty_squares(board)
  board.keys.select {|square| board[square] == INITIAL_MARKER}
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt("Select a square from #{joinor(empty_squares(board))}")
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    puts("Sorry that's not a valid choice")
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = computer_pick_square(board)
  board[square] = COMPUTER_MARKER
end

def square_in_danger(board, player)
  WINNING_LINES.each do |line|
    if line.count{|square| board[square] == player} == 2 && line.count{|square| board[square] == INITIAL_MARKER} == 1
      return line.select {|square| board[square] == INITIAL_MARKER}.first
    end
  end
  return nil
end

def computer_pick_square(board)
  def_move = square_in_danger(board, PLAYER_MARKER)
  off_move = square_in_danger(board, COMPUTER_MARKER)
  if off_move != nil
    return off_move
  elsif def_move != nil
    return def_move
  elsif board[5] == INITIAL_MARKER
    5
  else
    return empty_squares(board).sample
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if line.all?{|square| board[square] == PLAYER_MARKER}
      return 'Player'
    elsif line.all?{|square| board[square] == COMPUTER_MARKER}
      return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def first_turn(input)
  case input
  when 'c' then 'Computer'
  when 'p' then 'Player'
  when 'r' then ['Computer','Player'].sample
  end
end

def places_piece!(board, player)
  if player == 'Computer'
    computer_places_piece!(board)
  else
    player_places_piece!(board)
  end
end

score = {'Player' => 0, 'Computer' => 0}
cur_player = 'Player'
loop do
  prompt("Who should go first? (c)omputer or (p)layer, or (r) random")
  answer = gets.chomp
  if answer != 'c' || answer != 'p' || answer != 'r'
    cur_player = first_turn(answer)
    break
  end
end


loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    places_piece!(board, cur_player)
    cur_player = alternate_player(cur_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    winner = detect_winner(board)
    puts("#{winner} won!")
    score[winner] += 1
  else
    puts("It's a tie!")
  end
  if score[winner] == 5
    puts "#{winner} is the Grand winner"
    break
  else
    puts("Current score is Player: #{score['Player']}, Computer: #{score['Computer']}")
    prompt("Play again? y/n")
    play_again = gets.chomp
    break unless play_again.downcase.start_with?('y')
  end
end

puts("Thanks for playing tic-tac-toe!")
