#urn this array into a hash where the names are the keys and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def a_to_h(arr)
  flin_hash = {}
  arr.each_with_index do |name, index|
    flin_hash[name] = index
  end
  flin_hash
end

#Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def add_ages(hash)
  sum = 0
  hash.each do |name, age|
    sum += age
  end
  sum
end

# keeps all ages over 100
def remove_ages(hash)
  hash.keep_if do |name, age|
    age > 100
  end
  hash
end

# gets min age from hash
def min_age(hash)
  hash.values.min
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.index{|name| name.start_with?("Be")}

#get first three characters
flintstones.map! {|name| name[0,3]}

# counts occurence of each char into a hash
statement = "The Flintstones Rock"

def count_char(string)
  char_hash = {}
  counter = 0
  while counter < string.size
    cur_char = string[counter]
    if char_hash.has_key?(cur_char)
      char_hash[cur_char] += 1
    else
      char_hash[cur_char] = 1
    end
    counter += 1
  end
  char_hash
end

# capatalize the first of every word
def titelize(string)
  string.split.map {|word| word.capitalize}.join(" ")
end

puts titelize("the flintstones rock")

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
def which_age(age)
  if age > 0 && age <= 17
    return "kid"
  elsif age > 17 && age <= 64
    return "adult"
  else
    return "senior"
  end
end

munsters.each do |name, descrip|
  munsters[name]["age_group"] = which_age(munsters[name]["age"])
end

puts munsters
