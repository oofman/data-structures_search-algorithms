def radixSort(arr)
  temp = []
  res = []

  arr.each do |x|
    if temp[x].nil?
      temp[x] = 1
    else
      temp[x] = temp[x] + 1
    end
  end

  temp.each_with_index do |x, i|
    next unless x

    x.times do
      res.push(i)
    end
  end

  res
end

arr = [9434, 83, 74, 54, 54, 52, 41, 34, 11]
p 'Input: ' + arr.inspect
p 'Result: ' + radixSort(arr).inspect
