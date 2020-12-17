# Arr index in binary tree:
# Parent, Left and Right Child Index
#      i
#    /   \
# 2i+1  2i+2

class MaxHeap
  attr_accessor :heap, :heap_size

  CAPACITY = 10 # Max Items

  def initialize
    @heap = Array.new(CAPACITY, 0)
    @heap_size = 0
  end

  # Insert takse O(1) Running time, but we need to validate the heap O(LogN)
  def insert(item)
    return if CAPACITY == @heap_size # return if capacity reached

    # add item at next available spot
    @heap[@heap_size] = item
    @heap_size += 1

    # order head in correct order
    fix_up(@heap_size - 1)
  end

  # O(logN)
  # We consider the last items and checks if swaps are needed
  def fix_up(index)
    parent_index = index / 2 # find items parent

    return unless index.positive? && @heap[index] > @heap[parent_index] # Return if still valid

    swap(index, parent_index) # swap with parent is not valid
    fix_up(parent_index) # call recursivly fix all the way up
  end

  # O(1) * 2 Constant
  def swap(index1, index2)
    @heap[index2], @heap[index1] = @heap[index1], @heap[index2] # array swap keys
  end

  # O(1) Constant
  def get_max
    @heap[0]
  end

  # O(logN)
  def poll
    max = get_max

    # put item we remove last, as array size is fixed
    swap(0, @heap_size - 1)
    @heap_size -= 1

    # Fix all the way from index 0
    fix_down(0)

    max
  end

  # O(logN)
  # Check if Heap is valid from root down
  def fix_down(index)
    index_left = 2 * index + 1
    index_right = 2 * index + 2
    index_largest = index

    # If left child is bigger that parent
    index_largest = index_left if index_left < @heap_size && @heap[index_left] > @heap[index]
    # If left child is bigger that parent
    index_largest = index_right if index_right < @heap_size && @heap[index_right] > @heap[index_largest]
    # Dont swap with self
    return if index == index_largest

    swap(index, index_largest) # swap with parent is not valid
    fix_down(index_largest) # call recursivly fix all the way down
  end

  # O(NlogN)
  def heap_sort
    size = @heap_size

    (0...size).each do
      max = poll
      p max
    end
  end
end

h = MaxHeap.new
p "INIT Empty: #{h.heap}"
h.insert(10)
h.insert(8)
h.insert(12)
h.insert(20)
h.insert(-2)
h.insert(0)
h.insert(1)
h.insert(321)
h.insert(8)
h.insert(44)

p "Current Heap: #{h.heap}"
h.heap_sort
p "Heap Size: #{h.heap_size}"
p "Technically still there: #{h.heap}"
