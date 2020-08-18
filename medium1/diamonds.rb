def diamonds(dim)
  0.upto(dim-1) do |num|
    spaces = (num-dim/2).abs
    puts " "*spaces + "*"*(dim - spaces*2) + " "*spaces
  end

end

diamonds(15)
