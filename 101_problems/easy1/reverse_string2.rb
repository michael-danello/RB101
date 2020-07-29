# reverses words over five characters
def rev_string(string)
  rev_arr = string.split.map do |el|
    if el.size > 5
      el.reverse
    else
      el
    end
  end
  rev_arr.join(" ")
end

p rev_string('Professional')          # => lanoisseforP
p rev_string('Walk around the block') # => Walk dnuora the kcolb
p rev_string('Launch School')         # => hcnuaL loohcS
