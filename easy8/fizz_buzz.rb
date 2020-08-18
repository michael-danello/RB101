def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    if num % 5 == 0 and num % 3 == 0
      print "fizzbuzz"
    elsif num % 5 ==  0
      print "fizz"
    elsif num % 3 == 0
      print "buzz"
    else
      print num
    end
  end
end

fizzbuzz(1,15)
