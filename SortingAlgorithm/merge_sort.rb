# Merge Sort (comparoson based)
# O(N LogN) - garenteed
# D&C recursive (include base case)
# Stable
# Not In Place (theata Θ(n) additional memory)
# Best for linked lists
# Quick sort out preforms merge sort
def merge_sort(nums)
  # base case return
  return if nums.length == 1

  # devide
  middle_index = nums.length / 2
  left_half = nums[0...middle_index] # exclude pivot
  right_half = nums[middle_index..(nums.length)] # include pivot

  # recursively
  merge_sort(left_half)
  merge_sort(right_half)

  # conqur
  i = 0 # left sub array
  j = 0 # right sub array
  k = 0 # result array

  # while items left in both sub arrays (merge)
  while i < left_half.length && j < right_half.length
    if left_half[i] < right_half[j]
      nums[k] = left_half[i]
      i += 1
    elsif left_half[i] == right_half[j] # removing duplicates
      nums[k] = nil
      i += 1 # Can increment either
    else
      nums[k] = right_half[j]
      j += 1
    end
    k += 1
  end

  # if one sub-array empty copy the rest from other sub-array
  while i < left_half.length
    nums[k] = left_half[i]
    k += 1
    i += 1
  end

  # if one sub-array empty copy the rest from other sub-array
  while j < right_half.length
    nums[k] = right_half[j]
    k += 1
    j += 1
  end

  nums.compact
end

a = %w[W K A C Y E J T C]
puts merge_sort(a).inspect
