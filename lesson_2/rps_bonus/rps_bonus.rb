VALID_CHOICES = %w(rock paper scissors lizard spock)
WIN_THRESHOLD = 5

# maps letter input to choices
LETTER_TO_CHOICE = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

# moves as keys; moves they beat as values
WIN_HASH = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
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
def get_player_choice
  choice = Kernel.gets.chomp.downcase
  if VALID_CHOICES.include?(choice) || LETTER_TO_CHOICE.key?(choice)
    standardize_user_choice(choice)
  elsif choice == 's'
    prompt(MESSAGES['ambigious_input'])
  else
    prompt(MESSAGES['invalid_choice'])
  end
end

def retrieve_user_input
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    get_player_choice
end

def get_results(choice, computer_choice)
  if win?(choice, computer_choice)
    'player'
  elsif win?(computer_choice, choice)
    'computer'
  else
    'tie'
  end
end

def displays_results(result, choice, computer_choice)
  case result
  when 'player'
    prompt(MESSAGES['win'])
  when 'computer'
    prompt(MESSAGES['lose'])
  when 'tie'
    prompt(MESSAGES['tie'])
  end
    prompt("You chose #{choice}; Computer chose #{computer_choice}")
end

# converts single letter to full word
def standardize_user_choice(choice)
  if LETTER_TO_CHOICE.key?(choice)
    LETTER_TO_CHOICE[choice]
  else
    choice
  end
end

def update_score(result, score)
  unless result == 'tie'
    score[result] += 1
  end
end

def grand_winner?(score)
  [score['player'], score['computer']].max >= WIN_THRESHOLD
end

def display_grand_winner(score)
  grand_winner = nil
  if score['player'] >= WIN_THRESHOLD
    grand_winner = 'player'
  else
    grand_winner = 'computer'
  end
  prompt("Congratulations to the grand winner: #{grand_winner}!")
end

def play_again?
  prompt(MESSAGES['play_again'])
  gets.chomp.downcase == 'y'
end

def reset_score(score)
  score.each_key{|k| score[k] = 0}
end

choice = ''
score = {
  'player' => 0,
  'computer' => 0
}

system "clear"
prompt(MESSAGES['welcome'])

loop do
  prompt("Current Score is Player: #{score['player']} Computer: #{score['computer']}")
  loop do
    choice = retrieve_user_input
    break if !choice.nil?
  end

  computer_choice = VALID_CHOICES.sample

  results = get_results(choice, computer_choice)
  displays_results(results, choice, computer_choice)

  update_score(results, score)

  if grand_winner?(score)
    display_grand_winner(score)
    reset_score(score)
    break unless play_again?
  end
end
