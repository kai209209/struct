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

  def get_effective_size
    i = 0
    temp = head
    i += 1 while temp = temp.next
    i
  end

  def get_countdown_node(index)
    step = get_effective_size - index
    return '节点不存在' if step < 0
    temp = head.next
    step.times { temp = temp.next }
    p temp.to_s
    temp    
  end

  def revert_list
    return true if !head.next || !head.next.next

    temp_head = ListNode.new
    cur = head.next
    _next = nil

    while cur
      _next = cur.next
      cur.next = temp_head.next
      temp_head.next = cur
      cur = _next
    end

    head.next = temp_head.next
    temp_head.next = nil
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
    "节点信息 #{@no}, #{@name}, #{@nickname} #{self.next&.no}"
  end

end

p "按顺序添加"
l = LinkedList.new
l.add ListNode.new 5, 'a', 'aa'
l.add ListNode.new 4, 'd', 'dd'
l.add ListNode.new 4, 'd', 'dd'
l.add ListNode.new 2, 'b', 'bb'
l.add ListNode.new 9, 'c', 'cc'
l.add ListNode.new 9, 'c', 'cc'
l.list

p "按排序添加"
list = LinkedList.new
list.add_by_order ListNode.new 1, 'a', 'aa'
list.add_by_order ListNode.new 3, 'd', 'dd'
list.add_by_order ListNode.new 2, 'd', 'dd'
list.add_by_order ListNode.new 6, 'b', 'bb'
list.add_by_order ListNode.new 5, 'c', 'cc'
list.add_by_order ListNode.new 4, 'c', 'cc'
list.list

p "更新节点"
list.update(ListNode.new(2, 'ba', 'bbaa'))
list.list

p "删除节点"
list.destroy(6)
list.list

p "获取链表长度"
p list.get_effective_size

p "获取链表倒数的有效节点"
p list.get_countdown_node(3)

p "反序链表"
list.revert_list
list.list