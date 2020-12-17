# Quick Sort
# efficient
# out preform heap sort & merge sort
# avg O(N LogN) worst O(N*2)
# Not Stable
# In Place
# - Primitive Types - use quick sort
# - Reference Types - use merge sort
# D&C recursive
# choosing pivot item (at random or middle of array)
def partition(nums, low, high)
  # pivot is middle of arrau
  pivot_index = (low + high) / 2
  nums[pivot_index], nums[high] = nums[high], nums[pivot_index]

  i = low

  (low...high).each do |j|
    # deccending
    # if nums[j] > nums[high]
    # accending
    if nums[j] <= nums[high]
      nums[i], nums[j] = nums[j], nums[i]
      i += 1
    end
  end

  # swap pivot
  nums[i], nums[high] = nums[high], nums[i]

  i
end

def quick_sort(nums, low, high)
  # base case
  return if low >= high

  pivot = partition(nums, low, high)
  quick_sort(nums, low, (pivot - 1))
  quick_sort(nums, (pivot + 1), high)

  nums
end

a = [5, 2, 0, -5, 8, 4, 7, 1]
puts quick_sort(a, 0, (a.length - 1)).inspect
