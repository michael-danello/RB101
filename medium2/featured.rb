MAX = 1_023_456_987

def featured(num)
  if num >= MAX
    return nil
  else
    cur = (num / 7 + 1) * 7
    while true do
      if cur.odd? && cur.to_s.chars.uniq.size == cur.to_s.chars.size
        break
      end
      cur += 7
    end
    cur
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirement
