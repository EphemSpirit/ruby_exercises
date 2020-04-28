class Node

  attr_accessor :value, :next_node

  def initialize(value=nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head == nil
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head == nil
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    return 0 if @head == nil
    size = 0
    current_node = @head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if index < 0

    current_node = @head
    count = 0
    done = false

    until done
      if index == count
        done = true
      else
        count += 1
        current_node = current_node.next_node
      end
    end
    puts "Value at index #{index} is: #{current_node.value}"
  end

  def pop
    current_node = @head

    until current_node.next_node == @tail
      current_node = current_node.next_node
    end

    current_node.next_node = nil
    current_node = @tail
  end

  def contains?(value)
    current_node = @head
    found = false
    until current_node.nil?
      found = true if current_node.value == value
      current_node = current_node.next_node
    end
    found
  end

  def find(value)
    current_node = @head
    i = 0

    return i if current_node.value == value
    until current_node.value == value
      i += 1
      current_node = current_node.next_node
    end
    puts "Found value #{value} at index: #{i}"
  end

  def print
    current_node = @head
    until current_node.nil?
      puts "Current node value: #{current_node.value}"
      current_node = current_node.next_node
    end
  end

end

list = LinkedList.new
list.append(8)
list.append(10)
list.prepend(5)
puts list.size
puts list.find(8)
puts list.at(1)
puts list.contains?(8)
puts "\n\n"
list.print
