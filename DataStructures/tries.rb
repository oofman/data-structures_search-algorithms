class Node
  attr_accessor :children, :finished, :counter
  def initialize(char)
    @char = char
    @children = {}
    @finished = false
    @counter = 0
  end
end

class Trie
  def initialize
    @root = Node.new('*')
  end

  def insert(word)
    current = @root
    word.chars.each do |char|
      if current.children.include? char
        current = current.children[char]
        current.counter += 1
      else
        new_node = Node.new(char)
        current.children[char] = new_node
        current = new_node
        current.counter += 1
      end
    end
    #current.finished = true
  end

  def search(word)
    return false unless @root.children

    current = @root
    word.chars.each do |char|
      if word.chars.include? char
        current = current.children[char]
      else
        return false
      end
    end

    return true if current.finished

    false
  end
end

tree = Trie.new
tree.insert('bat')
tree.insert('hackathon')
tree.insert('hack')
tree.insert('hac')

p tree.search('hac')
p tree.search('hack')
p tree.search('testing')
