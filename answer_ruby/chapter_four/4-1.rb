# argument: array(type: array, value = 1 or 2), n(type: int)
# return: sorted-array(type: array)
def really_simple_sort(array, n)
  k = 0
  (0 .. n - 1).each do |i|
    k += 1 if array[i] == 1
  end
  (0 .. k).each do |i|
    array[i] = 1
  end
  (k + 1 .. n - 1).each do |i|
    array[i] = 2
  end
  array
end

first_array = []
10.times do |i|
  first_array.push(1, 2)
end
first_array.shuffle!

p first_array
p really_simple_sort(first_array, 20)
