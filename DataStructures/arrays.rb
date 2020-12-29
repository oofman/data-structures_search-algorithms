# Random Access (can access any index)

# Declarations - O(N)
# IE: arr = Array.new(4, nil)
arr = [10, 3, 'Test', 5, 96]
p 'Working with arr: ' + arr.inspect

# Update Value (index known) - O(1)
arr[2] = 'Testing'
p 'Updated value at index 2: ' + arr[2]
p 'Working with arr: ' + arr.inspect
p '---'

# Extracting values (non-destructive) - O(1)
p 'Listing first 3 values: ' + arr[0..-3].inspect
p 'Working with arr: ' + arr.inspect
p '---'

# Extracting values (destructive) - O(1)
p "Extracting last item: #{arr.pop}"
p 'Working with arr: ' + arr.inspect
p '---'

# Addition to the end - O(1)
p 'Adding 75 to the end of arr: '
arr.push(75)
p 'Working with arr: ' + arr.inspect
p '---'

# Addition to the start - O(N)
p 'Adding x to the start of arr: '
arr.unshift('x')
p 'Working with arr: ' + arr.inspect
p '---'

# Removing the first item - O(N)
p 'Removing first item from arr: '
arr.shift(1)
p 'Working with arr: ' + arr.inspect
p '---'

# Linear Search (Get Max Value) - O(N)
arr = [10, 3, 140, 56, 5, 96]
p 'Working with arr: ' + arr.inspect
max_val = arr[0]
arr.each { |v| max_val = v if v > max_val }
puts "Max Value: #{max_val}"
p '---'
