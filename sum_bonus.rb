def calculate_bonus(salary, bonus?)
  bonus? ? salary/2 : 0
end

calculate_bonus(100, true)
