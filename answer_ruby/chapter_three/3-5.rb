require 'benchmark'
# array(type: array)
# p(type: int)
# r(type: int)
# return-value = type:array
def quick_sort(array, p, r)
  return array if p >= r
  q = partition(array, p, r)
  quick_sort(array, p, q - 1)
  quick_sort(array, q + 1, r)
end

# argument: array(type: array), p, q, r(type: int)
# return-value: type:array
def partition(array, p, r)
  q = p
  (p .. r - 1).each do |u|
    if array[u] <= array[r]
      array[q], array[u] = array[u], array[q]
      q += 1
    end
  end
  array[q], array[r] = array[r], array[q]
  q
end

first_array = ((1..10).to_a).shuffle

p first_array
p quick_sort(first_array, 0, 9)