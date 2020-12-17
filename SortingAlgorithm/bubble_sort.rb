# compare adjacent objects
# last item sorted on each itteration
# O(N*2) Quadratic
# stable
# inplace
def bubble_sort(nums)
  # loop with each index in nums
  (0...nums.length).each do |i|
    # loop excluding more and more "sorted" items on the right
    (0...(nums.length - 1 - i)).each do |j|
      # swap if bigger
      nums[j], nums[j + 1] = nums[j + 1], nums[j] if nums[j] > nums[j + 1]
    end
  end

  nums
end

a = [4, 5, 3, 2, 4, 8, 7]
puts bubble_sort(a).inspect
