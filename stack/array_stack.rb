class ArrayStack
  attr_reader :max_size, :top, :stack

  def initialize(max_size = 0)
    @max_size = max_size
    @top = -1
    @stack = []
  end

  def push(object)
    return false if current_size > max_size - 1
    stack.push(object)
    @top += 1
    true
  end

  def pop(object = 1)
    return false unless current_size >= object
    o = stack.pop(object)
    @top -= object
    o
  end

  def list
    @stack
  end

  def current_size
    top + 1
  end


end