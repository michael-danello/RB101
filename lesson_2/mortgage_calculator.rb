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

def valid_apr(num)
  valid_num?(num) && (num.to_i >= 0 && num.to_i <= 100)
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

name = nil
prompt(MESSAGES["welcome"])
loop do
  name = gets.chomp
  if valid_name?(name)
    break
  else
    prompt(MESSAGES["name_error"])
  end
end

loop do
  prompt("Hi #{name}: " + MESSAGES["apr"])
  apr = nil
  loop do
    apr = gets.chomp
    if valid_apr(apr)
      apr = apr.to_f / 12
      break
    else
      prompt(MESSAGES["apr_error"])
    end
  end

  prompt(MESSAGES["loan_total"])
  loan_total = nil
  loop do
    loan_total = gets.chomp
    if valid_num?(loan_total)
      loan_total = loan_total.to_f
      break
    else
      prompt(MESSAGES["loan_total_error"])
    end
  end

  prompt(MESSAGES["loan_months"])
  loan_months = nil
  loop do
    loan_months = gets.chomp
    if valid_num?(loan_months)
      loan_months = loan_months.to_f
      break
    else
      prompt(MESSAGES["loan_months_error"])
    end
  end

  monthly = calculate_payment((apr) / 100, loan_total, loan_months)
  calc_message = <<-MSG
  With a an apr of #{apr},
  a loan duration of #{loan_months.to_i} months
  and a loan total payment of $#{loan_total},
  your monthly payment will be $#{monthly}
  MSG

  prompt(calc_message)

  prompt("Would you like to perfrom another calculation (y/n)")
  another = nil
  loop do
    another = gets.chomp
    if !another.include?('y') && !another.include?('n')
      prompt(MESSAGES["another_calc_error"])
      next
    end
    break
  end
  if another.downcase == 'y'
    next
  else
    break
  end
end
