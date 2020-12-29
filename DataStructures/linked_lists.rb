class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :number_of_nodes

  # O(1)
  def initialize(value)
    @head = Node.new(value, nil)
    @number_of_nodes = 1
  end

  # O(N)
  def insert_end(value)
    @number_of_nodes += 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?

    current_node.next_node = Node.new(value, nil)
  end

  # O(1)
  def insert_start(value)
    @number_of_nodes += 1
    @head = Node.new(value, @head)
  end

  # O(N)
  def find(value)
    # start at Head
    current_node = @head

    return false unless current_node.next_node # return if list is empty
    return current_node if current_node.value == value # return if value is found

    # loop through list nodes, till nil found
    while (current_node = current_node.next_node)
      return current_node if current_node.value == value # return if value is found
    end
  end

  # O(N)
  def deletion(value)
    current_node = @head # start at Head
    previous_node = nil # remember previous node to update ref after delete

    # Loop while not end and not the value we are looking for
    while !current_node.nil? && current_node.value != value
      previous_node = current_node
      current_node = current_node.next_node
    end

    return if current_node.nil? # search miss

    if previous_node.nil? # Removing the head Node
      @head = current_node.next_node # keep head updated
    else
      previous_node.next_node = current_node.next_node # update ref to remove from list
    end

    @number_of_nodes -= 1 # decremint counter if you got this far
  end

  # O(N)
  def print_list
    # start at head
    current_node = @head

    # loop till node.next_node = nil
    until current_node.nil?
      p current_node.value
      current_node = current_node.next_node
    end
  end
end

# Use
list = LinkedList.new(2)
list.insert_start(9)
list.insert_start(45)
list.insert_start(11)

list.insert_end(5)
list.insert_end(7)
list.insert_end(34)

list.deletion(5)

list.print_list
p "List Size:#{list.number_of_nodes}"
