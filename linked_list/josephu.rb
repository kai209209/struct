require 'byebug'

class BoyNode
  attr_accessor :next, :no

  def initialize(no)
    @no = no
  end
end

class CircleLinkedList
  attr_accessor :first, :current

  def initialize()
    @first = nil
  end

  def add_boy node
    return false unless BoyNode === node
    if !first
      first = node
      first.next = first
      current = first
    else
      current.next = node
      node.next = first
      current = node
    end
  end
end

class Abc
  attr_accessor :a
  def initialize()
    @a = nil
  end

  def do_sth(no)
    p "first: #{a.object_id}"
    p "first: #{@a.object_id}"
    a = no
    p a.class
    p "second #{a.object_id}"
    p
  end
end

a = Abc.new
a.do_sth(1)