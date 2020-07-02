require 'yaml'

MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")

def valid_int?(num)
  num == num.to_i.to_s
end

def valid_float?(num)
  num == num.to_f.to_s
end

def valid_num?(num)
  valid_float?(num) || valid_int?(num)
end

def valid_apr?(num)
  valid_num?(num) && (num.to_i > 0 && num.to_i <= 100)
end

def valid_loan_months?(months)
  valid_num?(months) && months.to_i > 0
end

def valid_loan_total?(loan_total)
  valid_loan_months?(loan_total)
end

def valid_calc_again?(calc_again)
  calc_again.downcase == 'y' || calc_again.downcase == 'n'
end

def valid_name?(name)
  /[a-zA-Z]+/ =~ name
end

def prompt(message)
  puts "#{message} >>"
end

def calculate_payment(monthly, loan_total, loan_months)
  loan_total * (monthly / (1 - (1 + monthly)**(-loan_months)))
end

def valid_input?(input_type, input)
  case input_type
  when "apr"
    valid_apr?(input)
  when "loan_months"
    valid_loan_months?(input)
  when "loan_total"
    valid_loan_total?(input)
  when "calc_again"
    valid_calc_again?(input)
  end
end

def retrieve_input(input_type)
  puts(MESSAGES[input_type])
  input = ''
  loop do
    input = gets.chomp
    break if valid_input?(input_type, input)
    puts MESSAGES["#{input_type}_error"]
  end
  input
end

prompt(MESSAGES["welcome"])

loop do
  apr = retrieve_input("apr").to_f
  loan_months = retrieve_input("loan_months").to_f
  loan_total = retrieve_input("loan_total").to_f

  monthly = calculate_payment((apr) / 100 / 12, loan_total, loan_months)

  prompt(format(MESSAGES["calc_message"], apr: apr, loan_months: loan_months,
  loan_total: loan_total, monthly: monthly))
  calc_again = retrieve_input("calc_again")
  if calc_again.downcase == 'y'
    system("clear")
    next
  else
    prompt(MESSAGES["goodbye"])
    break
  end
end
