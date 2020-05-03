class Node

  attr_reader :x, :y, :children, :parent

  def initialize(x, y, parent=nil) #parent set to nil since the first square has no parent
    @x = x
    @y = y
    @children = []
    @parent = parent #set a aprent so we can trace the parent ndoes back to the start
  end

  #generate Node children to make th 8x8 board
  def make_board
    options = []
    #push the individual moves that a knight can make from any given space
    options.push([@x + 2, @y - 1]).push([@x + 2, @y + 1]).
      push([@x + 1, @y - 2]).push([@x + 1, @y - 2]).
      push([@x - 1, @y - 2]).push([@x - 1, @y + 2]).
      push([@x - 2, @y - 1]).push([@x - 2, @y + 1])
    #make sure there are no squares generated outside the board space
    children = options.select{ |opt| opt[0] >= 0 && opt[0] <= 7 && opt[1] >= 0 && opt[1] <= 7 }
    #turn the children into node objects
    #passing in `self` establishes parent square
    #(the square `make_children` was called on (itself)
    children = children.map{ |child_space| Node.new(child_space[0], child_space[1], self) }
    @children = children
  end

  def get_search_object(search_obj, root_obj)
    queue = []
    queue.push(root_obj)
    loop do
      current = queue.shift
      return current if current.x == search_obj.x && current.y == search_obj.y
      current.make_board.each{ |child| queue.push(child) } #push all the squares into the queue to enable searching
    end
  end

  def find_path(root_arr, search_arr)
    search_obj = Node.new(search_arr[0], search_arr[1]) #turn the [x, y] for destiantion into a square obj
    root_obj = Node.new(root_arr[0], root_arr[1]) #do the same for the starting point
    result = get_search_object(search_obj, root_obj) #pass both to get_search_obj

    route = []
    route.unshift([search_obj.x, search_obj.y]) #unshift will tack it onto the end, letting us backtrack it
    current = result.parent
    until current == nil
      route.unshift([current.x, current.y])
      current= current.parent
    end
    puts "You made it in #{route.length - 1} moves! Here's your path: "
    route.each { |square| puts square.inspect }
    return nil
  end

end

node = Node.new(3, 4)
node.find_path([3, 4], [5, 2])
