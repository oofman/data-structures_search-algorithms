# We have seen in the previous lectures how to implement depth-first search with stack abstract data type.
# Of course we can use the stack memory of the OS (operating system) instead.
# So let's implement depth-first search with recursion!
class Node
  attr_accessor :name, :adjacency_list, :visited

  def initialize(name)
    @name = name
    @adjacency_list = []
    @visited = false
  end
end

# using a normal stack
# def depth_first_search(start_node)
#   stack = [start_node]

#   while stack
#     actual_node = stack.pop
#     actual_node.visited = true
#     puts actual_node.name

#     actual_node.adjacency_list.each do |node|
#       stack.push(node) unless node.visited
#     end

#   end
# end

# using OS stack Memory (recursion)
def depth_first_search(node)
  node.visited = true
  puts node.name

  node.adjacency_list.each do |n|
    depth_first_search(n) unless n.visited
  end
end

# First We create the nodes
node1 = Node.new('A')
node2 = Node.new('B')
node3 = Node.new('C')
node4 = Node.new('D')
node5 = Node.new('E')

# Set Children/Beighbours
node1.adjacency_list.append(node2)
node1.adjacency_list.append(node3)
node2.adjacency_list.append(node4)
node4.adjacency_list.append(node5)

depth_first_search(node1)
