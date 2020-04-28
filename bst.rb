require 'pry'

class Node

  attr_reader :data
  attr_accessor :left, :right

  def initialize(data=nil)
    @data = data
    @left = left
    @right = right
  end

end

class Tree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(arr)
    #arr = arr.sort!.uniq!
    arr.each do |data|
      node = Node.new(data)
      if @root.nil?
        @root = node
      else
        insert(@root, data)
      end
    end
  end

  def insert(node, data)
    if data < node.data
      if node.left
        insert(node.left, data)
      else
        node.left = Node.new(data)
      end
    else
      if node.right
        insert(node.right, data)
      else
        node.right = Node.new(data)
      end
    end
  end

  def in_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def preorder(node=@root, &block)
    return if node.nil?
    yield node
    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  def post_order(node=@root, &block)
    return if node.nil?
    post_order(node.left, &block)
    post_order(node.right, &block)
    yield node
  end

  def search(value, node=@root)
    return nil if node.nil?
    if value < node.data
      search(value, node.left)
    elsif value > node.data
      search(value, node.right)
    else
      return node
    end
  end

  def pretty_print(node = @root, prefix="", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
    pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
  end

end

arr = [76, 9, 63, 69, 98, 51, 58, 51, 47, 79]

tree = Tree.new
tree.build_tree(arr)
tree.pretty_print
puts tree.search(69)
# puts "Postorder:"
#
# tree.post_order do |node|
#   puts node.data
# end
#
# puts "Preorder:"
#
# tree.preorder do |node|
#   puts node.data
# end
#
# puts "In Order:"
#
# tree.in_order do |node|
#   puts node.data
# end
