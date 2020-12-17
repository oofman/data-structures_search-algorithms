###########################################
## LIFO - Last In First Out
###########################################
class Stack
  def initialize
    @stack = []
  end

  # insert into stack // O(1)
  def push(item)
    @stack.push(item)
  end

  # remove and return last item in stack // O(1)
  def pop
    return -1 if stack_size < 1

    data = @stack[-1]
    @stack.delete_at(-1)
    data
  end

  # return last item in stack // O(1)
  def peek
    @stack[-1]
  end

  # is stack empty // O(1)
  def is_empty
    @stack.is_empty
  end

  # stack size // O(1)
  def stack_size
    @stack.length
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
puts "Size: #{stack.stack_size}"
puts "Pop: #{stack.pop}"
puts "Size: #{stack.stack_size}"
puts "Peek: #{stack.peek}"
puts "Size: #{stack.stack_size}"
puts "Pop: #{stack.pop}"
puts "Pop: #{stack.pop}"
puts "Pop: #{stack.pop}"
puts "Size: #{stack.stack_size}"
