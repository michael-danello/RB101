def lights(n)
  all_flipped = []
  1.upto(n) do |round|
    all_flipped += (1..n/round).to_a.map {|el| el*round}
  end
  all_flipped.select {|num| all_flipped.count(num).odd?}.uniq
end

p lights(5)
p lights(10)
