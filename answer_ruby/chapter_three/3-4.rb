require 'benchmark'
# array(type: array)
# p(type: int)
# r(type: int)
# return-value = type:array
def merge_sort(array, p, r)
  return array if p >= r
  q = (p + r) / 2
  merge_sort(array, p, q)
  merge_sort(array, q + 1, r)
  merge(array, p, q, r)
end

# argument: array(type: array), p, q, r(type: int)
# return-value: type:array
def merge(array, p, q, r)
  array_b = array[p .. q].dup
  array_c = array[q + 1 .. r]
  array_b[array_b.length] = Float::INFINITY
  array_c[array_c.length] = Float::INFINITY
  i = 0
  j = 0
  (p..r).each do |k|
    if array_b[i] <= array_c[j]
      array[k] = array_b[i]
      i += 1
    else
      array[k] = array_c[j]
      j += 1
    end
  end
  array
end

first_array = ((1..10).to_a).shuffle

p first_array
p merge_sort(first_array, 0, 9)