def char_count(str)
  return 'NO' if str.length.zero?

  return 'YES' if str.length <= 3

  y=[]
  n = str.length
  i = 0
  z = s
  while n != 0
    y.append(s.count(s[i]))
    s = s.gsub(s[i], '')
    n = s.length
    min_number = y.count(y.min)
    max_number = y.count(y.max)
    min_val = y.min
    max_val = y.max
  end

  if ((max_val - min_val) == 1 && min_number + max_number == y.length) || z.length == 1
    if min_number == 1 || max_number == 1
      return "YES"
    else
      return "NO"
    end
  else
    return "NO"
  end
end
p char_count('abcdeeffghhgfedecba')
