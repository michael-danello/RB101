def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = reversed_words.insert(0, words[i])
    i += 1
  end

  reversed_words.join(' ')
end
# unshift does the same thing as insert
p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
