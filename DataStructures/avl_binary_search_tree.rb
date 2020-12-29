class Node
  attr_accessor :data, :left_child, :right_child, :parent, :height

  def initialize(data,parent)
    @data = data
    @left_child = nil
    @right_child = nil
    @parent = parent
    @height = 0
  end
end

class AVLTree
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
        node.height = [calculate_height(node.left_child), calculate_height(node.right_child)].max + 1
      end
    else # right sub tree
      if node.right_child
        insert_node(data, node.right_child)
      else
        node.right_child = Node.new(data, node)
        node.height = [calculate_height(node.left_child), calculate_height(node.right_child)].max + 1
      end
    end

    handle_violation(node)
  end

  def handle_violation(node)
    until node.nil?
      node.height = [calculate_height(node.left_child), calculate_height(node.right_child)].max + 1
      violation_helper(node)
      node = node.parent
    end
  end

  def violation_helper(node)
    balance = calculate_balance(node)

    # OK, we know the tree is left heavy BUT it can be left-right heavy or left-left heavy
    if balance > 1
      # left right heavy situation: left rotation on parent + right rotation on grandparent
      rotate_left(node.left_child) if calculate_balance(node.left_child).negative?

      # this is the right rotation on grandparent ( if left-left heavy, that's single right rotation is needed
      rotate_right(node)
    end

    # OK, we know the tree is right heavy BUT it can be left-right heavy or right-right heavy
    if balance < -1
      # right - left heavy so we need a right rotation  before left rotation
      rotate_right(node.right_child) if calculate_balance(node.right_child).positive?

      # left rotation
      rotate_left(node)
    end
  end

  # O(1) Constant
  def rotate_right(node)
    p "Rotating to the right on node ", node.data

    # Updated references
    temp_left_child = node.left_child
    t = temp_left_child.right_child

    temp_left_child.right_child = node
    node.left_child = t

    t.parent = node unless t.nil?

    # Updated parents
    temp_parent = node.parent
    node.parent = temp_left_child
    temp_left_child.parent = temp_parent

    if !temp_left_child.parent.nil? && temp_left_child.parent.left_child == node
      temp_left_child.parent.left_child = temp_left_child
    end

    if !temp_left_child.parent.nil? && temp_left_child.parent.right_child == node
      temp_left_child.parent.right_child = temp_left_child
    end

    # Updated root
    @root = temp_left_child if node == @root

    # Update heights
    node.height = [calculate_height(node.left_child), calculate_height(node.right_child)].max + 1
    temp_left_child.height = [calculate_height(temp_left_child.left_child),
                              calculate_height(temp_left_child.right_child)].max + 1
  end

  # O(1) Constant
  def rotate_left(node)
    p 'Rotating to the left on node ', node.data

    # Updated references
    temp_right_child = node.right_child
    t = temp_right_child.left_child

    temp_right_child.left_child = node
    node.right_child = t

    t.parent = node unless t.nil?

    # Updated parents
    temp_parent = node.parent
    node.parent = temp_right_child
    temp_right_child.parent = temp_parent

    if !temp_right_child.parent.nil? && temp_right_child.parent.left_child == node
      temp_right_child.parent.left_child = temp_right_child
    end

    if !temp_right_child.parent.nil? && temp_right_child.parent.right_child == node
      temp_right_child.parent.right_child = temp_right_child
    end

    # update root
    @root = temp_right_child if node == @root

    # update heights
    node.height = [calculate_height(node.left_child), calculate_height(node.right_child)].max + 1
    temp_right_child.height = [calculate_height(temp_right_child.left_child),
                               calculate_height(temp_right_child.right_child)].max + 1
  end

  def calculate_height(node)
    return -1 if node.nil?

    node.height
  end

  def calculate_balance(node)
    return 0 if node.nil?

    calculate_height(node.left_child) - calculate_height(node.right_child)
  end

  def traverse
    traverse_in_order(@root) unless @root.nil?
  end

  def traverse_in_order(node)
    traverse_in_order(node.left_child) if node.left_child

    puts 'V: %{node_data}' % { node_data: node.data.to_s }

    traverse_in_order(node.right_child) if node.right_child
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
        handle_violation(parent)

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
        handle_violation(parent)

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
        handle_violation(parent)

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
end

bst = AVLTree.new
bst.insert(1)
bst.insert(2)
bst.insert(5)
bst.insert(3)
bst.insert(7)
bst.insert(6)
bst.insert(8)
bst.traverse
bst.max_val
bst.remove(8)
bst.max_val
bst.min_val
bst.traverse
