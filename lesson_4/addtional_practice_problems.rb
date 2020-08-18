

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

# print out the total age of the family
# for each munster in the hash, select munster - for each hash, add age
age = 0
munsters.each do |name, descrip|
  if munsters[name]["gender"] == "male" # can turn these two lines into one
    age += munsters[name]["age"]
  end
end

munsters.each do |name, attr|
  puts "#{name} is a #{attr["age"]}-year-old #{attr["gender"]}."
end

# output vowels from all strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

all_vowels = ''
vowels = 'aeiou'
hsh.each do |key, value|
  value.each do
    for word in value
      word.chars.each do |char|
        all_vowels << char if vowels.include?(char)
      end
    end
  end
end


# sort each subgroup in reverse order
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = []
for sub_ar in arr
  arr2 << sub_ar.sort.reverse
end

# can also use the sort spaceship parameter b <=> a sort do

# increment by one
hsh = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

hsh2 = hsh.map do |el|
  el.each {|k,v| el[k] += 1}
end

# return only multiples of 3
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr2 = arr.map do |sub_arr|
   sub_arr.select do |num|
     num % 3 == 0
   end
end

# to hash
hsh = {}
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end

# sorted only by odd numbers
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# this was a better canidate for sort_by
arr2 = arr.sort do |s1, s2|
  s1.select {|num| num % 2 == 1} <=> s2.select {|num| num % 2 == 1}
end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# return colors of fruits and size of vegetables
# key should be _ here because it is not used
size_color = []
hsh.map do |_, value|
  size_color << value[:colors] if value[:type] == "fruit"
  size_color << value[:size].upcase if value[:type] == "vegetable"
end

#return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.map do |el|
  el.select do |_,v|
    v.all? {|num| num.even?}
  end
end


#"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91" uuid example
# could have used each with index
def create_uuid()
  chars = ("a".."z").to_a + ("0".."9").to_a
  u_arr = []
  lens = [8,4,4,4,12]
  for num in lens
    string = ''
    num.times {string += chars[rand(36)]}
    u_arr << string
  end
  u_arr.join("-")
end

p create_uuid
