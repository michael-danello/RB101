DEGREE = "\xC2\xB0"


def dms(angle)
  # hours = number modulo 360
  hours = angle.to_i % 360
  # minutes = decimal * 60 % 60
  minutes = ((angle - angle.to_i)*60) % 60
  seconds = ((minutes - minutes.to_i)*60).to_i % 60
  padded_minutes = minutes.to_i.to_s.rjust(2, '0')
  padded_seconds = seconds.to_s.rjust(2, '0')

  puts "%(#{hours}#{DEGREE}#{padded_minutes}\'#{padded_seconds}\")"
end


# you have to use divmod for these 

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
