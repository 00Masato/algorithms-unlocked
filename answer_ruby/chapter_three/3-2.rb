require 'benchmark'

# array(type: array)
# n:number-of-element(type: int)
def selection_sort(array, n)
  before_sorted_range = 0..n - 2
  before_sorted_range.each do |i|
    smallest = i
    after_sorted_range = i + 1..n - 1
    after_sorted_range.each do |j|
      smallest = j if array[j] < array[smallest]
    end
    array[i], array[smallest] = array[smallest], array[i]
  end
  array
end

first_array = ((1..1000).to_a).shuffle

p first_array
p selection_sort(first_array, 1000)