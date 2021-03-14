# argument: array(type: array, 0..m-1),
#           n(type: int, number-of-array-element),
#           m(type: int, range)
# return: array
def count_keys_equal(array, n, m)
  equal = Array.new(m, 0)
  (0 .. n - 1).each do |i|
    key = array[i]
    equal[key] += 1
  end
  equal
end

# argument: equal(type: array, value-of-count_keys_equal),
#           m(type: int, range)
# return: array
def count_keys_less(equal, m)
  less = Array.new(m)
  less[0] = 0
  (1 .. m - 1).each do |j|
    less[j] = less[j - 1] + equal[j - 1]
  end
  less
end

def rearrange(array, less, n, m)
  b_array = Array.new(n)
  b_next = Array.new(m)
  (0 .. m - 1).each do |j|
    b_next[j] = less[j] + 1
  end
  (0 .. n - 1).each do |i|
    key = array[i]
    index = b_next[key]
    b_array[index] = array[i]
    b_next[key] += 1
  end
  b_array.delete_at(0)
  b_array
end

def counting_sort(array, n, m)
  equal = count_keys_equal(array, n, m)
  less = count_keys_less(equal, m)
  rearrange(array, less, n, m)
end

sort_array = [4, 1, 5, 0, 1, 6, 5, 1, 5, 3]
p count_keys_equal(sort_array, 10, 7)
p count_keys_less(count_keys_equal(sort_array, 10, 7), 7)
p rearrange(sort_array, count_keys_less(count_keys_equal(sort_array, 10, 7), 7), 10, 7)
p counting_sort(sort_array, 10, 7)
