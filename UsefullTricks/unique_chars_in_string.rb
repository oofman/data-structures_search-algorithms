# Unique chars in string
def string_unique_count(str)
  str.chars.uniq.count
end
p string_unique_count('Hello')
