def count_array(array)
  occurences = {}
  array.each do |el|
    if occurences.has_key?(el)
      occurences[el] += 1
    else
      occurences[el] = 1
    end
  end 
  occurences.each do |inst, num|
    puts "#{inst} : #{num}"
  end
end

count_array(vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
])
