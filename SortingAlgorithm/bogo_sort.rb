# Bogo Sort (Shotgun sort / Permutation sort)
# compare adjacent objects
# 2 Variants:
# - Deterministic
#   - Enumerates all possible permutations untill it finds the sorted order
# - Randomized
#   - randomly generates permutations untill it finds the sorted order
# O(N!) Factorial
# Usefull with Quantum computers 
# - O(1) - Using Quantum intanglemen
# - Search each possible permutation simultaneously

class BogoSort
  attr_accessor :nums
  def initialize(nums)
    @nums = nums
  end

  def sort
    until sorted?
      p 'Every day im shuffling...'
      shuffel
    end
  end

  # fisher-Yates shuffle
  # In place algorrythm
  def shuffel
    n = @nums.length
    while n.positive?
      x = rand(n -= 1)
      @nums[x], @nums[n] = @nums[n], @nums[x]
    end
  end

  def sorted?
    (0...(@nums.length - 1)).each do |i|
      return false if @nums[i] > @nums[i + 1]
    end
    true
  end
end

a = [4, -2, 1, 12, 3]
bogo = BogoSort.new(a)
bogo.sort
puts bogo.nums.inspect
