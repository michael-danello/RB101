# asks the user for two numbers
# asks the user for an opeartion to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end
prompt(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets.chomp()
  unless name.empty?
    break
  end
end

# prompt user for a number
loop do
  prompt("Welcome #{name}")
  number1 = ''
  loop do
    prompt(MESSAGES['first_num'])
    number1 = Kernel.gets().chomp()
    if valid_num?(number1)
      break
    else
      puts "Invalid Number"
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_num'])
    number2 = Kernel.gets().chomp()
    if valid_num?(number2)
      break
    else
      puts "Invalid Number"
    end
  end


  prompt(MESSAGES['operator_msg'])

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("must choose 1, 2, 3, or 4")
    end
  end

  puts "The result is " + case operator
                          when '1'
                            (number1.to_i + number2.to_i).to_s
                          when '2'
                            (number1.to_i - number2.to_i).to_s
                          when '3'
                            (number1.to_i * number2.to_i).to_s
                          when '4'
                            (number1.to_f / number2.to_f).to_s
                          end
  prompt("Do yuo want to perform another calcuation? (y/n)")
  answer = Kernel.gets.chomp()
  break unless answer.downcase.start_with?('Y')
end

prompt("Thank you for using calculator. Goodbye!")
