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
    while true
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
      p "no: #{temp.no}, #{temp.name}, #{temp.nickname}, next: #{temp.next&.no}"
      break if temp.next.nil?
      temp = temp.next
    end
  end

  def update(node)
    temp = head
    while true
      if temp.next.nil?
        p '节点不存在'
        break
      end

      if temp.no == node.no
        temp.name = node.name
        temp.nickname = node.nickname
        break
      end

      temp = temp.next
    end
  end

  def destroy(no)
    temp = head
    while true
      if temp.next.nil?
        p "节点不存在"
        break
      end

      if temp.next.no == no
        temp.next = temp.next.next
        break
      end
      temp = temp.next
    end
    
  end

  private
  attr_reader :head
  
end

class ListNode
  attr_reader :no
  attr_accessor :next, :name, :nickname

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
p "--------1"
list.update(ListNode.new(2, 'ba', 'bbaa'))
list.list
p "--------2"
list.destroy(5)
list.list
