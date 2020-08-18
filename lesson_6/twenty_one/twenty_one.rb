# frozen_string_literal: true

require_relative 'twenty_one_graphic.rb'
require 'YAML'

face_cards = %w[K Q J]
num_cards = (2..10).to_a
full_suit = face_cards + num_cards << 'A'
card_values_keys = %w[ACE_LOW ACE_HIGH] + num_cards + face_cards
card_values_values = [1, 11] + num_cards + [10] * 3

MESSAGES = YAML.load_file('twenty_one_messages.yml')
CARD_VALUES = Hash[card_values_keys.zip(card_values_values)]
BUST = 22
DECK = {
  hearts: full_suit.clone,
  diamonds: full_suit.clone,
  clubs: full_suit.clone,
  spades: full_suit.clone
}.freeze

def prompt(message)
  puts " \n#{message} =>"
end

def puts_n(message)
  puts " \n#{message}"
end

def initialize_hands
  { 'Player' => [], 'Computer' => [] }
end

def ran_card
  suit = DECK.keys.sample
  num = DECK[suit].sample
  DECK[suit].delete(num)
  [num, suit]
end

def deal_card(player, hands)
  hands[player] << ran_card
end

def deal_first_hand(hands)
  system 'clear'

  2.times { deal_card('Player', hands) }
  2.times { deal_card('Computer', hands) }
end

def tally(hand)
  ace_count = hand.count { |card| card[0] == 'A' }
  tally = hand.reject { |card| card[0] == 'A' }.reduce(0) { |sum, card| sum + CARD_VALUES[card[0]] }
  ace_count.times { tally += determine_ace_value(tally) }
  tally
end

def determine_ace_value(tally)
  tally > 10 ? CARD_VALUES['ACE_LOW'] : CARD_VALUES['ACE_HIGH']
end

def bust?(hand)
  tally(hand) >= BUST
end

def display_hands(hands)
  display_all_hands(hands)
end

def calculate_final_score(hands)
  p_score = tally(hands['Player'])
  c_score = tally(hands['Computer'])
  winner = case
           when bust?(hands['Computer']) then 'Player'
           when bust?(hands['Player']) then 'Computer'
           when p_score == c_score then 'Tie'
           when p_score > c_score then 'Player'
           when p_score < c_score then 'Computer'
           end
  return winner, p_score, c_score
end

def display_final_score(hands)
  winner, p_score, c_score = calculate_final_score(hands)
  puts_n "You had #{p_score}. Computer had #{c_score}. #{winner} wins!"
end

def greet
  system 'clear'
  display_welcome_message
  prompt MESSAGES['welcome']
end

def start_game_loop?
  greet
  loop do
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')

    if answer.start_with?('n')
      puts_n MESSAGES['no_play']
      return false
    end
    puts_n MESSAGES['invalid_choice']
  end
end

def hit_again_player?(hands)
  loop do
    puts_n "Your current tally is #{tally(hands['Player'])}"
    prompt MESSAGES['hit_again']
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')

    return false if answer.start_with?('n')

    puts_n MESSAGES['invalid_choice']
  end
end

def hit_again_computer?(hands)
  sleep(0.5)
  tally(hands['Computer']) <= 17
end

def hit_again?(hands, player)
  player == 'Player' ? hit_again_player?(hands) : hit_again_computer?(hands)
end

def deal_loop(hands, player)
  loop do
    display_hands(hands)
    return 'Busted' if bust?(hands[player])

    break unless hit_again?(hands, player)

    deal_card(player, hands)
  end
end

def game_loop(hands)
  display_hands(hands)
  player_outcome = deal_loop(hands, 'Player')
  if player_outcome == 'Busted'
    puts_n MESSAGES['player_bust']
  else
    computer_outcome = deal_loop(hands, 'Computer')
    puts_n MESSAGES['computer_bust'] if computer_outcome == 'Busted'
  end
  flip_cards(hands)
  display_final_score(hands)
end

def play_again_loop?
  loop do
    prompt MESSAGES['play_again']
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')

    return false if answer.start_with?('n')

    puts_n MESSAGES['invalid_choice']
  end
end

loop do
  if start_game_loop?
    hands = initialize_hands
    deal_first_hand(hands)
    game_loop(hands)
    next if play_again_loop?

  end
  break
end
