
BLOCK1 = %w(B X D C N G R F J H V L Z)
BLOCK2 = %w(O K Q P A T E S W U I Y M)
H1 = BLOCK1.zip(BLOCK2).to_h

def block_word?(word)
  word.each_char do |char|
    char = char.upcase
    if BLOCK1.include?(char)
      return false if word.include?(H1[char])
    else
      return false if word.include?(H1.key(char))
    end
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
