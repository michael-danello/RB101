def get_minutes(minutes)
  if minutes >= 0
    hour_hand = (minutes / 60) % 24
    minutes_hand = minutes%60
    time_of_day(hour_hand, minutes_hand)
  else
    hour_hand = (minutes / 60) % 24
    minutes_hand =  minutes%60
    time_of_day(hour_hand, minutes_hand)
  end
end


def time_of_day(hour_hand, minutes_hand)
  if minutes_hand < 10 && hour_hand < 10
    puts "0#{hour_hand}:0#{minutes_hand}"
  elsif hour_hand < 10
    puts "0#{hour_hand}:#{minutes_hand}"
  elsif minutes_hand < 10
    puts "#{hour_hand}:0#{minutes_hand}"
  else
    puts "#{hour_hand}:#{minutes_hand}"
  end
end
# get_minutes(0) == "00:00"
# get_minutes(-3) == "23:57"
# get_minutes(35) == "00:35"
# get_minutes(-1437) == "00:03"
# get_minutes(3000) == "02:00"
# get_minutes(800) == "13:20"
# get_minutes(-4231) == "01:29"

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
#
# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

def after_midnight(string)
  hours,minutes = string.split(":")[0],string.split(":")[1]
  _, remainder = (60*hours.to_i+minutes.to_i).divmod(1440)
  remainder
end

def before_midnight(string)
  hours,minutes = string.split(":")[0],string.split(":")[1]
  _, remainder = (-60*hours.to_i+-minutes.to_i).divmod(1440)
  remainder
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
