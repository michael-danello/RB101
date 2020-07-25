def get_produce(fruit_hash)
  produce = {}
  fruit_hash.each do |k,v|
    if v == 'Fruit'
      produce[k] = v
    end
  end
  produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts get_produce(produce)
