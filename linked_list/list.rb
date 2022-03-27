class LinkedList
  def initialize
    @head = ListNode.new
  end

  def add(node)
    temp = head
    temp = temp.next until temp.next.nil?
    temp.next = node
  end

  def add_by_order(node)
    temp = head
    while true do
      if temp.next.nil?
        temp.next = node
        break
      end

      if temp.next.no > node.no
        node.next = temp.next
        temp.next = node
        break
      end

      if temp.next.no == node.no
        p "#{node.no} 已存在"
        break
      end

      temp = temp.next
    end
  end

  def list
    temp = head
    while
      p "no: #{temp.no}, #{temp.name}, #{temp.nickname}"
      break if temp.next.nil?
      temp = temp.next
    end
  end

  private
  attr_reader :head
  
end

class ListNode
  attr_reader :no, :name, :nickname
  attr_accessor :next

  def initialize(no = nil, name = nil, nickname = nil)
    @no = no
    @name = name
    @nickname = nickname
  end

end

list = LinkedList.new
list.add_by_order ListNode.new 5, 'a', 'aa'
list.add_by_order ListNode.new 4, 'd', 'dd'
list.add_by_order ListNode.new 4, 'd', 'dd'
list.add_by_order ListNode.new 2, 'b', 'bb'
list.add_by_order ListNode.new 9, 'c', 'cc'
list.add_by_order ListNode.new 9, 'c', 'cc'
list.list