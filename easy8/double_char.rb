def repeater(string)
  double = ""
  string.each_char{|char| double << char*2}
  double
end

def double_consonants(string)
  double = ""
  vowels = 'aeiouAEIOU'
  string.each_char do |char|
    if vowels.include?(char) || char.upcase == char.downcase
      double << char
    else
      double << char*2
    end
  end
  p double
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
