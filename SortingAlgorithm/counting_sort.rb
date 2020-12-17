# only for when vairation in keys close to the amount of items
# key values as indexes
# sub-routine in radix sort
# O(N+K) Running time (N = number of items) (K = diff between min and max)
# Not Inplace (more mem needed)
def counting_sort(arr)
  min, max = arr.minmax #get min and max items in arr
  p "MIN-MAX: #{min},#{max}"
  amount = max - min + 1
  p "AMOUNT: #{amount}"
  count = Array.new(amount, 0) # create arr indexes bigger than max index, set to 0
  # p "COUNT ARR: #{count.inspect}"
  arr.each { |number| count[number - min] += 1 } # increment corresponding index with amount in arr
  # p "COUNT ARR2: #{count.inspect}"
  # loop between min and max
  # count[i - min] start at 0 index
  tmp = [] # build back array
  (min..max).each_with_object([]) do |i, ary|
    ary.concat([i] * count[i - min])
    # p ary.inspect
    tmp = ary
  end
  #p "RES:: #{tmp}"
  tmp
end

# Same thing just extending the arr class
class Array
  def counting_sort
    min, max = minmax
    count = Array.new(max - min + 1, 0)
    each { |number| count[number - min] += 1 }
    (min..max).each_with_object([]) { |i, ary| ary.concat([i] * count[i - min]) }
  end
end

ary = Array.new(20) { rand(-10..10) }
p "Unsorted: #{ary.inspect}"
p 'Sorted: ' + ary.counting_sort.inspect
# p 'Sorted: ' + counting_sort(ary).inspect
