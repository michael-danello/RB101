def triangle(side1, side2, side3)
  tri_arr = [side1, side2, side3]
  if tri_arr.any? {|side| side >= tri_arr.sum/2.0}
    :invalid
  else
    case tri_arr.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    when 3 then :scalene
    end
  end
end


 triangle(3, 3, 3) #== :equilateral
 triangle(3, 3, 1.5) #== :isosceles
 triangle(3, 4, 5) #== :scalene
 triangle(0, 3, 3) #== :invalid
 triangle(3, 1, 1) #== :invalid
