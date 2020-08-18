def print_in_box(str)
  # prints text within a box
  # 1. prints line above of '+' + (string len + 2) of - + '+'
  # 2. for 1 line print | plus string len + 2 spaces + |
  # 3. print | + space + string + space + |
  # 4. Repeat 2.
  # 5. Repeat 1.
  inside_box = str.size + 2
  horizontal_border_line = "+" + "-"*inside_box + "+"
  vertical_border_line = "|" + " "*inside_box + "|"
  padded_string = "|" + " " + str + " " + "|"

  puts horizontal_border_line
  puts vertical_border_line
  puts padded_string
  puts vertical_border_line
  puts horizontal_border_line
end


print_in_box('Hello there!')
