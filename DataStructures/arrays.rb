# Random Access
# Declarations - O(N)
# arr = Array.new(4, nil)
arr = [10, 3, 'Test', 5, 96]

# update - O(1)
arr[2] = 'Testing'
p arr[2]

# extracting values (non-destructive) - O(1)
p arr[0..-3].inspect
p arr[2]

# extracting values (destructive) - O(1)
p "Extracted: #{arr.pop}"
p "Left Width: #{arr.inspect}"

# addition to the end - O(1)
arr.push(5)
p arr

# Linear Searsh - O(N)
# Get Max Value:
arr = [10, 3, 56, 5, 96]
max_val = arr[0]
arr.each { |v| max_val = v if v > max_val }
puts "Max: #{max_val}"
