class Node
  attr_accessor :data, :parent, :color, :left_child, :right_child

  def initialize(data, parent = nil, color = 'red')
    @data = data
    @parent = parent
    @color = color
    @left_child = nil
    @right_child = nil
  end
end

class RedBlackTree
  def initialize
    @root = nil
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data)
      violate(@root)
    else
      insert_node(data, @root)
    end
  end

  def insert_node(data, node)
    if data < node.data
      if node.left_child
        insert_node(data, node.left_child)
      else
        node.left_child = Node.new(data, node)
        violate(node.left_child)
      end
    else
      if node.right_child
        insert_node(data, node.right_child)
      else
        node.right_child = Node.new(data, node)
        violate(node.right_child)
      end
    end
  end

  def violate(node)

    parent_node = nil
    grand_parent_node = nil

    while node != @root && node.parent.color == 'red'
      parent_node = node.parent
      grand_parent_node = parent_node.parent

      return if grand_parent_node.nil?

      if parent_node == grand_parent_node.left_child
        uncle = grand_parent_node.right_child
        if uncle && uncle.color == 'red'
          # case 1 and case 4
          p 'Re-coloring node %s to RED ' % grand_parent_node.data
          grand_parent_node.color = 'red'
          p 'Re-coloring node %s to BLACK ' % parent_node.data
          parent_node.color = 'black'
          uncle.color = 'black'
          node = grand_parent_node
        else
          # case 2: uncle node is black and node is a right child
          if node == parent_node.right_child
            rotate_left(parent_node)
            node = parent_node
            parent_node = node.parent
          end

          # case 3
          parent_node.color = 'black'
          grand_parent_node.color = 'red'
          p 'Re-color %s to BLACK' % parent_node.data
          p 'Re-color %s to RED' % grand_parent_node.data
          rotate_right(grand_parent_node)
        end
      else
        uncle = grand_parent_node.left_child
        if uncle && uncle.color == 'red'
          # case 1 and case 4
          p 'Re-coloring node %s to RED' % grand_parent_node.data
          grand_parent_node.color = 'red'
          p 'Re-coloring node %s to BLACK' % parent_node.data
          parent_node.color = 'black'
          uncle.color = 'black'
          node = grand_parent_node
        else
          # case 2: uncle node is black and node is a right child
          if node == parent_node.left
            rotate_right(parent_node)
            node = parent_node
            parent_node = node.parent
          end
          # case 3
          parent_node.color = 'black'
          grand_parent_node.color = 'red'
          p 'Re-color %s to BLACK' % parent_node.data
          p 'Re-color %s to RED' % grand_parent_node.data
          rotate_left(grand_parent_node)
        end
      end

      if @root.color == 'red'
        p 'Recoloring the root to black...'
        @root.color = 'black'
      end
    end
  end

  def traverse
    traverse_in_order(@root) unless @root.nil?
  end

  def traverse_in_order(node)
    if node.left_child
      traverse_in_order(node.left_child)
    end

    l = ''
    r = ''
    parent = ''

    unless node.left_child.nil?
      l = node.left_child.data
    else
      l = nil
    end

    unless node.right_child.nil?
      r = node.right_child.data
    else
      r = nil
    end

    unless node.parent.nil?
      parent = node.parent.data
    else
      parent = nil
    end
    p '%s left: %s right: %s parent: %s color: %s' % [node.data, l, r, parent, node.color]
    traverse_in_order(node.right_child) if node.right_child
  end

  def rotate_right(node)
    p 'Rotating to the right on node ', node.data

    temp_left_node = node.left_child
    t = temp_left_node.right_child

    temp_left_node.right_child = node
    node.left_child = t

    t.parent = node unless t.nil?

    temp_parent = node.parent
    node.parent = temp_left_node
    temp_left_node.parent = temp_parent

    if !temp_left_node.parent.nil? && temp_left_node.parent.left_child == node
      temp_left_node.parent.left_child = temp_left_node
    end

    if !temp_left_node.parent.nil? && temp_left_node.parent.right_child == node
      temp_left_node.parent.right_child = temp_left_node
    end

    @root = temp_left_node if node == @root
  end

  def rotate_left(node)
    p 'Rotating to the left on node ', node.data

    temp_right_node = node.right_child
    t = temp_right_node.left_child

    temp_right_node.left_child = node
    node.right_child = t

    t.parent = node unless t.nil?

    temp_parent = node.parent
    node.parent = temp_right_node
    temp_right_node.parent = temp_parent

    if !temp_right_node.parent.nil? && temp_right_node.parent.left_child == node
      temp_right_node.parent.left_child = temp_right_node
    end

    if !temp_right_node.parent.nil? && temp_right_node.parent.right_child == node
      temp_right_node.parent.right_child = temp_right_node
    end

    @root = temp_right_node if node == @root
  end
end

rbt = RedBlackTree.new
rbt.insert(32)
rbt.insert(10)
rbt.insert(55)
rbt.insert(1)
rbt.insert(19)
rbt.insert(79)
rbt.insert(16)
rbt.insert(23)
rbt.insert(12)

rbt.traverse
