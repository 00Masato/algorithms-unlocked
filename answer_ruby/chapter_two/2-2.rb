require 'benchmark'


# array:(type: array)
# n:number-of-index(type: integer)
# x:answer(type: integer)
def linear_search(array, n, x)
  answer_index = 'NOT-FOUND'
  array.each_with_index do |a, i|
    if a == x
      answer_index = i
    end
  end
  answer_index
end

def better_linear_search(array, n, x)
  array.each_with_index do |a, i|
    return i if a == x
  end
  'NOT-FOUND'
end

def sentinel_linear_search(array, n, x)
  last_value = array[n-1]
  # set sentinel
  array[n-1] = x
  i = 0
  while array[i] != x do
    i += 1
  end
  array[n-1] = last_value
  return i if i < n-1 || array[n-1] == x
  'NOT-FOUND'
end

# i: (type: int)
def recursive_linear_search(array, n, i, x)
  return 'NOT-FOUND' if i > n
  return i if array[i] == x
  recursive_linear_search(array, n, i+1, x)
end

first_array = []
1000.times do |p|
  first_array.push(1, 2, 3, 4, 5)
end

Benchmark.bm 10 do |r|
  r.report 'linear_search_found' do
    p linear_search(first_array, first_array.length, 3)
  end
  r.report 'linear_search_not_found' do
    p linear_search(first_array, first_array.length, 9)
  end
  r.report 'better_linear_search_found' do
    p better_linear_search(first_array, first_array.length, 3)
  end
  r.report 'better_linear_search_not_found' do
    p better_linear_search(first_array, first_array.length, 9)
  end
  r.report 'sentinel_linear_search_found' do
    p sentinel_linear_search(first_array, first_array.length, 3)
  end
  r.report 'sentinel_linear_search_not_found' do
    p sentinel_linear_search(first_array, first_array.length, 9)
  end
  r.report 'recursive_linear_search_found' do
    p recursive_linear_search(first_array, first_array.length, 0, 3)
  end
  r.report 'recursive_linear_search_not_found' do
    p recursive_linear_search(first_array, first_array.length, 0, 9)
  end
end
