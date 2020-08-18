S_I = {
  '0'=> 0,
  '1'=> 1,
  '2'=> 2,
  '3'=> 3,
  '4'=> 4,
  '5'=> 5,
  '6'=> 6,
  '7'=> 7,
  '8'=> 8,
  '9'=> 9,
  '-' => -1,
  '+' => 1
}

I_S = {
  0=>'0' ,
  1=>'1' ,
  2=>'2' ,
  3=>'3' ,
  4=>'4' ,
  5=>'5' ,
  6=>'6' ,
  7=>'7' ,
  8=>'8' ,
  9=>'9'
}

def string_to_signed_integer(string)
  if string[0] == '+' || string[0] == '-'
    S_I[string[0]]*string_to_integer(string[string[1..]])
  else
    string_to_integer(string)
  end
end


def string_to_integer(string)
  dig_arr = string.chars.reverse.each_with_index.map{|char,idx| S_I[char]*10**(idx)}.inject(:+)
end

def int_to_signed_string(int)
  if int < 0
    "-" + integer_to_string(-int)
  else
    "+" + integer_to_string(int)
  end
end

def integer_to_string(integer)
  int_string = ""
  num_digs = Math.log(integer, 10).to_i
  for dig in (0..num_digs).to_a.reverse
    n_dig = integer/10**dig
    int_string << I_S[n_dig]
    integer -= n_dig*10**dig
  end
  int_string
end


puts int_to_signed_string(-123)
puts int_to_signed_string(683)
puts int_to_signed_string(0)
