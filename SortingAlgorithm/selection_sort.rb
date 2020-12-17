# O(N*2) Quadratic
# Not Stable
# In Place
# better than bubble
# (for items of 30 or less)
# Less writes than insertion - O(N) writes
def selection_sort(nums)
  # loop with each index in nums (excluding last index)
  (0...(nums.length - 1)).each do |i|
    index = i
    # Liniar search for the smallest item
    # loop excluding more and more "sorted" items on the left
    ((i + 1)...nums.length).each do |j|
      index = j if nums[j] < nums[index]
    end

    nums[index], nums[i] = nums[i], nums[index] if index != i
  end
  nums
end

a = [5, 2, 0, -5, 8, 4, 7]
puts selection_sort(a).inspect
