VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
     (first == 'rock' && second == 'scissors') ||
     (first == 'paper' && second == 'rock') ||
     (first == 'scissors' && second == 'paper')
end

def displays_results(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt("You win")
  elsif win?(computer_choice, choice)
    prompt("You lose")
  else
    prompt("It's a tie!")
  end
end

def increment_score(choice, computer_choice)
  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  end
end

def display_match_score(player_wins, computer_wins)
  prompt("Computer: #{computer_wins} Player: #{player_wins}")
end

def grand_winner?(player_wins, computer_wins)
  player_wins >= 5 || computer_wins >= 5
end

def set_grand_winner
  if player_wins >= 5
    grand_winner = "Player"
  else
    grand_winner = "Computer"
  end
end

player_wins = 0
computer_wins = 0
choice = ''
grand_winner = nil

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  displays_results(choice, computer_choice)
  increment_score(choice, computer_choice)

  if grand_winner(player_wins, computer_wins)
    set_grand_winner
    prompt("Congratulations #{grand_winner}, you are the grand winner")
    break
  end

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end
