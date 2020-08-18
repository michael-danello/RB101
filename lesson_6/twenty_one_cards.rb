# creds to ejm98 for the inspiration for the cards https://www.asciiart.eu/miscellaneous/playing-cards

CARD_WIDTH = 7
CARD_HEIGHT = 7

SYM_MAP = {
0 => "",
1 => " * ",
2 => "* *",
3 => "***",
4 => "** **"
}

SUITS = {
  :hearts => "v",
  :diamonds => "*",
  :clubs => "%",
  :spades => "o",
  "K" => 'K',
  "Q" => 'Q',
  "A" => 'A',
  'J' => 'J'
}

def make_card_back
  " _______ " + "\n" +
  "|#{"* ".*CARD_WIDTH/2}*|" + "\n" +
  "|#{" *".*CARD_WIDTH/2} |" + "\n" +
  "|#{"* ".*CARD_WIDTH/2}*|" + "\n" +
  "|#{" *".*CARD_WIDTH/2} |" + "\n" +
  "|#{"".rjust(CARD_WIDTH, "_")}|"
end


def make_card(card)
  num = card[0]
  suit = card[1]

  if ['K','Q','J','A'].include?(num)
    card_interior = make_card_interior(9, num)
  else
    card_interior = make_card_interior(num, suit)
  end
       " _______ " + "\n" +
       "|#{num.to_s.ljust(CARD_WIDTH)}|" + "\n" +
       "|#{card_interior[0].center(CARD_WIDTH)}|" + "\n" +
       "|#{card_interior[1].center(CARD_WIDTH)}|" + "\n" +
       "|#{card_interior[2].center(CARD_WIDTH)}|" + "\n" +
       "|#{num.to_s.rjust(CARD_WIDTH, "_")}|"

end

def make_card_interior(num, suit)
  if num == 10
    int_arr = [3,4,3]
  else
    int_arr = [0,0,0]
    row = 0
    while num > 3
      int_arr[row] = num % 3 == 0 ? 3 : num % 3
      num -=  int_arr[row]
      row += 1
    end
    int_arr[row] = num
    int_arr[0], int_arr[1] = int_arr[1], int_arr[0]
  end
  int_arr.map {|el| SYM_MAP[el].gsub("*", SUITS[suit])}
end

def display_welcome_message
puts  "$$\\      $$\\ $$$$$$$$\\ $$\\      $$$$$$\\   $$$$$$\\  $$\\      $$\\ $$$$$$$$\\       $$$$$$$$\\  $$$$$$\\         $$$$$$\\   $$\\" + "\n" +
      "$$ | $\\  $$ |$$  _____|$$ |    $$  __$$\\ $$  __$$\\ $$$\\    $$$ |$$  _____|      \\__$$  __|$$  __$$\\       $$  __$$\\$$$$ |" + "\n" +
      "$$ |$$$\\ $$ |$$ |      $$ |    $$ /  \\__|$$ /  $$ |$$$$\\  $$$$ |$$ |               $$ |   $$ /  $$ |      \\__/  $$ \\_$$ |" + "\n" +
      "$$ $$ $$\\$$ |$$$$$\\    $$ |    $$ |      $$ |  $$ |$$\\$$\\$$ $$ |$$$$$\\             $$ |   $$ |  $$ |       $$$$$$  | $$ |" + "\n" +
      "$$$$  _$$$$ |$$  __|   $$ |    $$ |      $$ |  $$ |$$ \\$$$  $$ |$$  __|            $$ |   $$ |  $$ |      $$  ____/  $$ |" + "\n" +
      "$$$  / \\$$$ |$$ |      $$ |    $$ |  $$\\ $$ |  $$ |$$ |\\$  /$$ |$$ |               $$ |   $$ |  $$ |      $$ |       $$ |" + "\n" +
      "$$  /   \\$$ |$$$$$$$$\\ $$$$$$$$\\$$$$$$  | $$$$$$  |$$ | \\_/ $$ |$$$$$$$$\\          $$ |    $$$$$$  |      $$$$$$$$\\$$$$$$\\" + "\n" +
      "\\__/     \\__|\\________|\\________\\______/  \\______/ \\__|     \\__|\\________|         \\__|    \\______/       \\________\\______|"
end


def flip_cards(hands)
  puts_n "Flipping cards now..."
  display_graphic_hand(hands['Player'])
  display_graphic_hand(hands['Computer'])
end

def display_all_hands(hands)
  system "clear"
  display_graphic_hand(hands['Player'])
  display_graphic_hand(hands['Computer'], true)
end

def display_graphic_hand(hand, hide_cards=false)

  card_arr = []
  hand.each {|card| card_arr << make_card(card)} if card_arr.empty?
  card_arr[0] = make_card_back if hide_cards
  joined_cards = card_arr[0].split("\n")
  card_arr[1..-1].each do |card|
    lines = card.split("\n")
    lines.each_with_index do |line, idx|
      joined_cards[idx] += "  #{line}"
    end
  end
  puts joined_cards
end
