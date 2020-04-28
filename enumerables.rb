module Enumerable
  def my_each(n, &block)
    for item in n do
      block.call
    end
  end

  def my_each_with_index(n, &block)
    i = 0
    while i < n.size
      yield at(i)
      i += 1
    end
  end

  def my_select(n) #loop over the array items. if it returns true, select it
    result = []
    n.my_each do |i|
      if yield(i) == true
        result.push(n[i])
      end
    end
    result
  end

  def my_all?(array, &block) #loop over the array and return true if the block returns true for all items
    result = []
    n.my_each do |i|
      if yield(i) == false
        return false
      end
    end
    return true
  end

  def my_any?(array, &block)
    result = []
    n.my_each do |i|
      if yield(i) == true
        return true
      end
      return false
    end
  end

  def my_none?(array, &block)
    result = []
    n.my_each do |i|
      result.push(yield(i))
    end
    result.include? true ? false : true
  end

  def my_count(string, &block)
    counter = 0
    string.chars.each do |i|
      if (yield(i)) == true
        counter += 1
      end
    end
    counter
  end

  def my_map(n, &block)
    #iterate over an array, and for each index position, set the value of that index equal to what teh block returns
    n.my_each do |i|
      n[i] = yield(i)
    end
    n
  end

  def my_inject(n, &block)
    
  end

end
