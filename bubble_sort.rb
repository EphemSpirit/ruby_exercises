#take in an array
#while looping over that array, compare the item on the left with the item on the right
#if item on the right is greater than the item on the left, swap their indeces
#max number will now be at array[-1]
#loopback over the array until no more swpas happen, and return the final output

def bubble_sort array
  sorted = true
  while sorted
    sorted = false
    (array.length-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = true
      end
    end
  end
  array
end
