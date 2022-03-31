require './linked_list/josephu'
require 'byebug'
RSpec.describe CircleLinkedList do
  describe "CircleLinkedList" do

    describe "CircleLinkedList usage" do
      subject(:circle) do
        CircleLinkedList.new()
      end 

      it "can build circle with boys" do
        boy1 = BoyNode.new(1)
        boy2 = BoyNode.new(2)
        boy3 = BoyNode.new(3)
        boy4 = BoyNode.new(4)
        boy5 = BoyNode.new(5)
        circle.add_boy(boy1)
        circle.add_boy(boy2)
        circle.add_boy(boy3)
        circle.add_boy(boy4)
        circle.add_boy(boy5)

        expect(boy1.next).to eq boy2
        expect(boy2.next).to eq boy3
        expect(boy3.next).to eq boy4
        expect(boy4.next).to eq boy5
        expect(boy5.next).to eq boy1
 
      end
    end
  end
end