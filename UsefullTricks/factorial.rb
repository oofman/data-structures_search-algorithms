def factorial(num)
  # Base Case
  return 1 if num.zero?

  # Recursive Call
  num * factorial(num - 1) # Stack Overflow if recursion is too deep
end

num = 4
puts "factorial(#{num}) : #{factorial(num).inspect}"