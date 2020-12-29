class Node
  attr_accessor :data, :left_child, :right_child, :parent

  def initialize(data,parent)
    @data = data
    @left_child = nil
    @right_child = nil
    @parent = parent
    @hight = 0
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data, nil)
    else
      insert_node(data, @root)
    end
  end

  # O(logN) But only if tree is balanced
  def insert_node(data, node)
    if node.data > data # left sub tree
      if node.left_child
        insert_node(data, node.left_child)
      else
        node.left_child = Node.new(data, node)
      end
    else # right sub tree
      if node.right_child
        insert_node(data, node.right_child)
      else
        node.right_child = Node.new(data, node)
      end
    end
  end

  def traverse_dfs
    @in_order = []
    depth_first_search(@root) unless @root.nil?
    puts "DFS Traversal: #{@in_order}"
  end

  def depth_first_search(node)
    # recursive to the left get smallest
    depth_first_search(node.left_child) if node.left_child

    @in_order.push(node.data)

    # recursive to the right till empty
    depth_first_search(node.right_child) if node.right_child
  end

  # with iteration
  def max_val
    node = @root
    node = node.right_child until node.right_child.nil?
    puts "MAX ITEM: #{node.data.inspect}"
  end

  def min_val
    node = get_min(@root) unless @root.nil?
    puts "MIN ITEM: #{node.data.inspect}"
  end

  # with recursion
  def get_min(node)
    if node.left_child
      get_min(node.left_child)
    else
      node
    end
  end

  def remove_node(data, node)
    return if node.nil?

    if data < node.data
      remove_node(data, node.left_child)
    elsif data > node.data
      remove_node(data, node.right_child)
    else
      if node.left_child.nil? && node.right_child.nil?
        puts 'Removing a leaf node...%d' % node.data
        parent = node.parent

        parent.left_child = nil if !parent.nil? && parent.left_child == node
        parent.right_child = nil if !parent.nil? && parent.right_child == node
        @root = nil if parent.nil?
        #node = nil

      elsif node.left_child.nil? && !node.right_child.nil?  # node !!!
        puts 'Removing a node with single right child...'
        parent = node.parent

        if !parent.nil?
          parent.left_child = node.right_child if parent.left_child == node
          parent.right_child = node.right_child if parent.right_child == node
        else
          @root = node.right_child
        end

        node.right_child.parent = parent
        #node = nil

      elsif node.right_child.nil? && !node.left_child.nil?
        puts 'Removing a node with single left child...'
        parent = node.parent

        if !parent.nil?
          parent.left_child = node.left_child if parent.left_child == node
          parent.right_child = node.left_child if parent.right_child == node
        else
          @root = node.left_child
        end

        node.left_child.parent = parent
        #node = nil

      else
        puts 'Removing node with two children....'
        predecessor = get_predecessor(node.left_child)
        temp = predecessor.data
        predecessor.data = node.data
        node.data = temp

        remove_node(data, predecessor)
      end
    end
  end

  def get_predecessor(node)
    return get_predecessor(node.right_child) if node.right_child

    node
  end

  def remove(data)
    puts 'Removing data...%d' % data
    remove_node(data, @root) unless @root.nil?
  end

  def traverse_bfs
    breadth_first_search(@root)
  end

  def breadth_first_search(node)
    queue = [];  # first in, first out
    output = []; # storing the output
    queue.push(node); # store the first node, which is root into queue

    until queue.empty? # when the queue is not empty
      current = queue.shift # get the first element of the queue
      queue.push(current.left_child) if current.left_child # from left
      queue.push(current.right_child) if current.right_child # to right
      output.push(current.data) # store value to output
    end

    puts 'BFS Traversal: [' + output.join(', ') + ']'
  end
end

bst = BinarySearchTree.new
bst.insert(2)
bst.insert(8)
bst.insert(5)
bst.insert(4)
bst.insert(9)
bst.insert(24)
bst.insert(11)
bst.insert(3)
bst.insert(7)
bst.insert(12)
bst.traverse_dfs # Depth first search
bst.traverse_bfs # Breadth first search
