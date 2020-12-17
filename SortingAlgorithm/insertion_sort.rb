# Insertion sort
# O(N*2)
# (for items of 30 or less)
# Adaptive / Stable / InPlace
# More writes than selection - O(N*2) writes
# Active avg (can insert new items at end while running)
def insertion_sort(nums)
  (1...nums.length).each do |i|
    j = i

    # quadatic but adaptive part
    while j.positive? && nums[(j - 1)] > nums[j]
      nums[j], nums[(j - 1)] = nums[(j - 1)], nums[j]
      j -= 1
    end
  end
  nums
end

a = [5, 2, 0, -5, 8, 4, 7, 99, 500, -8, 7]
puts insertion_sort(a).inspect
