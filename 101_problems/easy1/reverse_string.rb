# reverses the words in a string

def rev_string(string)
  string.split.reverse.join(" ")
end

rev_string("hello there") #=> "there hello"
rev_string("") #=> ""
rev_string("what who") #=> "who what"
