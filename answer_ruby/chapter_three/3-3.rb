require 'benchmark'

# array: sort-array(type: array)
# n: number-of-index(type: int)
def insertion_sort(array, n)
  (1..n-1).each do |i|
    key = array[i]
    j = i - 1
    while j >= 0 && array[j] > key do
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = key
  end
  array
end

first_array = ((1..1000).to_a).shuffle

p first_array
p insertion_sort(first_array, 1000)