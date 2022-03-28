class LinkedList
  attr_reader :head

  def initialize
    @head = ListNode.new
  end

  def add(node)
    temp = head
    temp = temp.next until !temp.next
    temp.next = node
  end

  def add_by_order(node)
    if preview_node = find_preview(node)
      node.next = preview_node.next
      preview_node.next = node
    else
      p "#{node.no} 已存在"
    end

  end

  def find_preview(node)
    temp = head
    return temp if !temp.next
    return false if temp.next.no == node.no
    return temp if temp.next.no > node.no

    while temp = temp.next
      return temp if !temp.next
      return false if temp.next.no == node.no
      return temp if temp.next.no > node.no
    end
  end

  def update(node)
    temp = head
    while true
      case
      when !temp.next
        p '节点不存在'
        break
      when temp.no == node.no
        temp.name = node.name
        temp.nickname = node.nickname
        break
      else
        temp = temp.next
      end
    end
  end

  def destroy(no)
    temp = head
    while true
      case
      when !temp.next
        p "节点不存在"
        break
      when temp.next.no == no
        temp.next = temp.next.next
        break
      else
        temp = temp.next
      end
    end
    
  end

  def list
    temp = head
    p "no: #{temp.no}, #{temp.name}, #{temp.nickname}, next: #{temp.next&.no}"
    p "no: #{temp.no}, #{temp.name}, #{temp.nickname}, next: #{temp.next&.no}" while temp = temp.next
  end

  private
  
end

class ListNode
  attr_reader :no
  attr_accessor :next, :name, :nickname

  def initialize(no = nil, name = nil, nickname = nil)
    @no = no
    @name = name
    @nickname = nickname
  end

  def to_s
    "节点信息 #{@no}, #{@name}, #{@nickname}"
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
list.destroy(9)
list.list
p "--------3"
l = LinkedList.new
l.add ListNode.new 5, 'a', 'aa'
l.add ListNode.new 4, 'd', 'dd'
l.add ListNode.new 4, 'd', 'dd'
l.add ListNode.new 2, 'b', 'bb'
l.add ListNode.new 9, 'c', 'cc'
l.add ListNode.new 9, 'c', 'cc'
l.list
