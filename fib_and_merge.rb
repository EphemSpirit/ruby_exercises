def fibs n
  a, b = 0, 1
  n.times { a, b = b, a + b }
end

fibs 8

def rec_fib n
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return rec_fib(n-2) + rec_fib(n-1)
  end
end

puts rec_fib 8

def merge_sort arr
  return arr if arr.length == 1
  middle = arr.length/2
  merge merge_sort(arr[0...middle]), merge_sort(arr[middle..-1])
end

def merge left, right
  final = []
  until left.empty? || right.empty?
    final << (left[0] < right[0] ? left.shift : right.shift)
  end
  final + left + right
end

puts merge_sort [1, 4, 2, 7, 8]
