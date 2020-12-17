def times_two(arg1)
  puts arg1 * 2
end

def sum(arg1, arg2)
  puts arg1 + arg2
end

p "1"
times_two 5
p "2"
times_two(5)
p "3"
times_two (5)
p "4"
sum 1, 2
p "5"
sum(1, 2)
p "6"
# sum (1, 2) # generate syntax error
