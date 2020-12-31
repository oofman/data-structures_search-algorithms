# generalization of insertion sort
# Unstable / InPlace / Adaptive
# O(n*2)
# Not parallel

def shell_sort(nums)
  gap = nums.length / 2

  # shell sort
  while gap.positive?

    # same as insertion sort
    (0...nums.length).step(gap) do |i|
      j = i
      while j >= gap && nums[j - gap] > nums[j]
        nums[j], nums[(j - gap)] = nums[(j - gap)], nums[j]
        j -= gap
      end
    end
    gap /= 2
  end

  nums
end

a = [5, 2, 0, -5, 8, 4, 7, 99, 500, -8, 7]
puts shell_sort(a).inspect
