# removes all non alphanumerics and leaves one space for non alphanumerics
a_z = ("a".."z").to_a
nums = ("0".."9").to_a
ALPHA = a_z + nums

def cleanup(word)
  spaced = false
  clean_string = ""
  word.chars.each do |char|
    if ALPHA.include?(char)
      clean_string << char
      spaced = false
    else
      if spaced == false
        clean_string << " "
        spaced = true
      end
    end
  end
  p clean_string
end

cleanup("---what's my +*& line?") == ' what s my line '
