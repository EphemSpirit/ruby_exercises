class Square

  attr_reader :x, :y, :children, :parent

  def initialize(x, y, parent=nil)
    @x = x
    @y = y
    @children = []
    @parent = parent
  end

  def make_squares
    possible_moves = [[@x + 2, @y + 1], [@x + 2, @y - 1],
                      [@x - 2, @y + 1], [@x - 2, @y - 1].
                      [@x + 1, @y + 2], [@x - 1, @y + 2].
                      [@x + 1, @y - 2], [@x - 1, @y - 2]]

    valid_moves = possible_moves.select{ |sq| sq[0] >= 0 && sq[0] <= 7 && sq[1] >= 0 && sq[1] <= 7 }
    children = valid_moves.map{ |node| Square.new(node[0], node[1], self)}
    @children = children
  end

  def get_search_node(search_node, root_node)
    queue = []
    queue << root_obj #start the search at the root square
    loop do
      current = queue.shift #current is now the root square
      return current if current.x == search_node.x && current.y == search_node.y #return if the search node is the startign point
      current.make_board.each{ |child| queue << child } #turn the queue into a @d array housing all the possible moves from the starting point
    end
  end
