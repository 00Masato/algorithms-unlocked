require 'benchmark'


# array:(type: array)
# n:number-of-index(type: integer)
# x:answer(type: integer)
def binary_search(array, n, x)
  lead_index = 0
  last_index = n-1
  while lead_index <= last_index do
    middle_index = (lead_index + last_index) / 2
    return 'NOT-FOUND' if array[middle_index].nil?
    if array[middle_index] == x
      return middle_index
    elsif array[middle_index] > x
      last_index = middle_index - 1
    else
      lead_index = middle_index + 1
    end
  end
  'NOT-FOUND'
end

# p:lead_index(type: int)
# r:last_index(type: int)
def recursive_binary_search(array, p, r, x)
  return 'NOT-FOUND' if p > r
  middle_index = (p + r) / 2
  if array[middle_index] == x
    return middle_index
  elsif array[middle_index] > x
    return recursive_binary_search(array, p, middle_index - 1, x)
  else
    recursive_binary_search(array, middle_index + 1, r, x)
  end
end

first_array = []
value = 1
1000.times do |n|
  first_array.push(value)
  value += 1
end


Benchmark.bm 10 do |r|
  r.report 'binary_search_found' do
    p binary_search(first_array, first_array.length, 800)
  end
  r.report 'binary_search_not_found' do
    p binary_search(first_array, first_array.length, 1001)
  end
  r.report 'recursive_binary_search_found' do
    p recursive_binary_search(first_array, 0, first_array.length - 1, 800)
  end
  r.report 'recursive_binary_search_not_found' do
    p recursive_binary_search(first_array, 0, first_array.length - 1, 1001)
  end
end