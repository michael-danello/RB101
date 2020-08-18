
def max_rotation(num)
  final_num = []
  num_s = num.to_s
  0.upto(num_s.size-1) do |_|
    rot = rotate_rightmost_digits(num_s, num_s.size)
    final_num << rot[0]
    num_s = rot[1..-1]
  end
  final_num.join.to_i
end


def rotate_rightmost_digits(num, rot_size)
  num_s = num
  rot_part = num_s[-rot_size..-1]
  non_rot_part = num_s[0..-rot_size-1]
  rot_arr = rotate_array(rot_part.chars).join
  (non_rot_part + rot_arr)
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end


# all_digits[-n..-1] returns the last n digits

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
