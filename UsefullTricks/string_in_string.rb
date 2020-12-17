# Does string 1 contain string 2
def string_contain_string(str1, str2)
  contain = false # Default false

  # base case (if the strings are empty)
  return contain if !str1.length || !str2.length

  str1.chars.each do |i|
    if str2.index(i)
      contain = true
      break
    end
  end
  contain
end
str1 = 'Hello'
str2 = 'pac'
# str2 = 'lo'
p string_contain_string(str1, str2) ? 'Yes' : 'No'
