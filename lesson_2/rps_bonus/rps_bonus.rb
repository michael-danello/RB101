VALID_CHOICES = %w(rock paper scissors lizard spock)

# maps letter input to choices
LETTER_TO_CHOICE = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock',
}

# moves as keys; moves they beat as values
WIN_HASH = {
  'rock' => ['scissors','lizard'],
  'paper' => ['rock', 'spock'],
  'scissors'=> ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors','rock']
}

require 'yaml'
MESSAGES = YAML.load_file('rps_bonus.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_HASH[first].include?(second)
end

# accepts both single letter input and full words
def get_player_choice()
  choice = Kernel.gets.chomp.downcase
  if VALID_CHOICES.include?(choice) or LETTER_TO_CHOICE.key?(choice)
    return standardize_user_choice(choice)
  elsif choice == 's'
    prompt(MESSAGES['ambigious_input'])
  else
    prompt(MESSAGES['invalid_choice'])
  end
end

def get_results(choice, computer_choice)
  if win?(choice, computer_choice)
    return 'player'
  elsif win?(computer_choice, choice)
    return 'computer'
  else
    return 'tie'
  end
end

def displays_results(result)
  case result
  when 'player'
    prompt(MESSAGES['win'])
  when 'computer'
    prompt(MESSAGES['lose'])
  when 'tie'
    prompt(MESSAGES['tie'])
  end
end

# converts single letter to full word
def standardize_user_choice(choice)
  if LETTER_TO_CHOICE.key?(choice)
    return LETTER_TO_CHOICE[choice]
  else
    return choice
  end
end

def update_score(result, user, score)
  if result == user
    score += 1
  else
    score
  end
end


def grand_winner?(player_wins, computer_wins)
  if [player_wins, computer_wins].max >= 5
    true
  else
    false
  end
end

def display_grand_winner(player_wins)
  grand_winner = nil
  if player_wins >= 5
      grand_winner ='player'
  else
      grand_winner ='computer'
  end
  prompt("Congratulations to the grand winner: #{grand_winner}!")
end

def play_again?()
  prompt(MESSAGES['play_again'])
  gets.chomp.downcase == 'y'
end

choice = ''
player_wins = 0
computer_wins = 0

system "clear"
prompt(MESSAGES['welcome'])

loop do
  prompt("Current Score is Player: #{player_wins} Computer: #{computer_wins}")
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = get_player_choice()
    break if choice =! nil
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  results = get_results(choice, computer_choice)
  displays_results(choice)

  player_wins = update_score(results, 'player', player_wins)
  computer_wins = update_score(results, 'computer', computer_wins)

  if grand_winner?(player_wins, computer_wins)
    display_grand_winner(player_wins)

    player_wins = 0
    computer_wins = 0

    break unless play_again?
  end
end
