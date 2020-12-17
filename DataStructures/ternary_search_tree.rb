class Node
  attr_accessor :character, :left_node, :middle_node, :right_node, :value
  def initialize(character)
    @character = character
    @left_node = nil
    @middle_node = nil
    @right_node = nil
    @value = 0
  end
end

class Tst
  def initialize
    @rootNode = nil
  end

  def put(key, value)
    @rootNode = putItem(@rootNode, key, value, 0)
  end

  def putItem(node, key, value, index)
    c = key[index]
    node = Node.new(c) if node.nil?
    #raise node.inspect
    if c < node.character
      node.left_node = putItem(node.left_node, key, value, index)
    elsif c > node.character
      node.right_node = putItem(node.right_node, key, value, index)
    elsif index < (key.length - 1)
      node.middle_node = putItem(node.middle_node, key, value, (index + 1))
    else
      node.value = value
    end

    node
  end

  def get(key)
    node = getItem(@rootNode, key, 0)
    return -1 if node.nil?

    node.value
  end

  def getItem(node, key, index)
    return nil if node.nil?

    c = key[index]
    if c < node.character
      getItem(node.left_node, key, index)
    elsif c > node.character
      getItem(node.right_node, key, index)
    elsif index < (key.length - 1)
      getItem(node.middle_node, key, (index + 1))
    else
      node
    end
  end
end

tst = Tst.new
tst.put('apple', 100)
tst.put('banana', 45)
tst.put('mango', 75)
tst.put('orange', 500)

p tst.get('apple')
p tst.get('steve')
p tst.get('orange')
