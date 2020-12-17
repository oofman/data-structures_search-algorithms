# Open addressing -> liniar probing
class HashTable
  def initialize
    @size = 10
    @keys = Array.new(@size)
    @values = Array.new(@size)
  end

  def put(key, value)
    index = hash_me(key)

    # collision 
    until @keys[index].nil?
      if @keys[index] == key
        @values[index] = value
        return
      end

      # rehash try find another slot
      index = (index + 1) % @size
    end

    @keys[index] = key
    @values[index] = value
  end

  def get(key)
    index = hash_me(key)
    until @keys[index].nil?
      return @values[index] if @keys[index] == key

      index = (index + 1) % @size
    end

    # key not present
    nil
  end

  def hash_me(key)
    sum = 0
    (0...key.length).each do |i|
      sum += key[i].ord
    end

    (sum % @size)
  end
end

ht = HashTable.new
ht.put('apple', 10)
ht.put('orange', 20)
ht.put('car', 30)
ht.put('table', 40)
p ht.get('orange')
p ht.get('tests')

my_hash = { 'one' => 1, 'two' => 2, 'three' => 3 }
p my_hash.keys
p my_hash.values
p my_hash['one']
