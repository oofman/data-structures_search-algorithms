###########################################
## FIFO - First In First Out
###########################################
class Queue
  def initialize
    @queue = []
  end

  # is stack empty // O(1)
  def empty?
    @stack.is_empty
  end

  # add to queue // O(1)
  def enqueue(item)
    @queue.push(item)
  end

  # remove from queue // O(N)
  # Double Linked List will change to // O(1)
  def dequeue
    return -1 if queue_size < 1

    data = @queue[0]
    @queue.delete_at(0)
    data
  end

  # look at next item // O(1)
  def peek
    @queue[0]
  end

  # stack size // O(1)
  def queue_size
    @queue.length
  end
end

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
puts "Size: #{queue.queue_size}"
puts "Dequeue: #{queue.dequeue}"
puts "Size: #{queue.queue_size}"
puts "Peek: #{queue.peek}"
puts "Size: #{queue.queue_size}"
puts "Dequeue: #{queue.dequeue}"
puts "Dequeue: #{queue.dequeue}"
puts "Dequeue: #{queue.dequeue}"