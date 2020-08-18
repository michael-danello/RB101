def star(size)
  middle = size/2 + 1
  1.upto(size) do |row|
    if row == middle
      puts "*"*size
    else
      mid_num = (row-middle).abs - 1
      end_num = (size-mid_num*2 -3)/2
      mid_spaces = " "*mid_num
      end_spaces = " "*end_num
      puts end_spaces + "*" + mid_spaces + "*" + mid_spaces + "*" + end_spaces
    end
  end
end

star(25)
