require './linked_list/list'

RSpec.describe LinkedList do
  describe "LinkedList list" do
    it "LinkNode generate success" do
      node = ListNode.new(1, 'first node', 'first node nickname')

      expect(node.no).to eq 1
      expect(node.name).to eq 'first node'
      expect(node.nickname).to eq 'first node nickname'
    end

    it "linked list get effective size and get correct node" do
      l = LinkedList.new
      node1 = ListNode.new 5, 'a', 'aa'
      node2 = ListNode.new 4, 'd', 'dd'
      node3 = ListNode.new 4, 'd', 'dd'
      node4 = ListNode.new 2, 'b', 'bb'
      node5 = ListNode.new 9, 'c', 'cc'
      node6 = ListNode.new 9, 'c', 'cc'
      l.add node1
      l.add node2
      l.add node3
      l.add node4
      l.add node5
      l.add node6

      expect(l.get_effective_size).to eq 6
      expect(l.get_node(7)).to eq 'Not exist'
      expect(l.get_node(1)).to eq node1
      expect(l.get_node(2)).to eq node2
      expect(l.get_node(3)).to eq node3
      expect(l.get_node(4)).to eq node4
      expect(l.get_node(5)).to eq node5
      expect(l.get_node(6)).to eq node6
    end

    describe "LinkedList usage sample" do
      subject(:list) do
        l = LinkedList.new
        l.add_by_order ListNode.new 1, 'a', 'aa'
        l.add_by_order ListNode.new 3, 'd', 'dd'
        l.add_by_order ListNode.new 2, 'd', 'dd'
        l.add_by_order ListNode.new 6, 'b', 'bb'
        l.add_by_order ListNode.new 5, 'c', 'cc'
        l.add_by_order ListNode.new 4, 'c', 'cc'     
        l   
      end 

      it "renew node info" do
        expect(list.get_node(5).no).to eq 5
        expect(list.get_node(5).name).to eq 'c'
        expect(list.get_node(5).nickname).to eq 'cc'

        list.update(ListNode.new(5, 'ba', 'bbaa'))

        expect(list.get_node(5).no).to eq 5
        expect(list.get_node(5).name).to eq 'ba'
        expect(list.get_node(5).nickname).to eq 'bbaa'
      end

      it "destroy node" do
        expect(list.get_node(5).no).to eq 5
        list.destroy(5)

        expect(list.get_node(5).no).to eq 6
      end

      it "get countdown node" do
        expect(list.get_countdown_node(3).no).to eq 4
      end

      it "revert list" do
        list.revert_list
        expect(list.get_node(1).no).to eq 6
        expect(list.get_node(2).no).to eq 5
        expect(list.get_node(3).no).to eq 4
        expect(list.get_node(4).no).to eq 3
        expect(list.get_node(5).no).to eq 2
        expect(list.get_node(6).no).to eq 1
      end
    end

  end



end