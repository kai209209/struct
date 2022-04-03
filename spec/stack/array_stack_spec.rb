require './stack/array_stack'

RSpec.describe ArrayStack do
  describe "ArrayStack" do
    describe "ArrayStack usage sample" do
      before(:all) do
        @stack = ArrayStack.new(10)
      end

      it "stack max size is 10" do
        expect(@stack.max_size).to eq 10
      end

      it "stack can add object and list objects" do
        expect(@stack.current_size).to eq 0
        a1 = "object1"
        a2 = "object2"
        a3 = "object3"
        a4 = "object4"
        a5 = "object5"
        a6 = "object6"
        a7 = "object7"
        a8 = "object8"
        a9 = "object9"
        a10 = "object10"
        a11 = "object11"
        @stack.push(a1)
        @stack.push(a2)
        @stack.push(a3)
        @stack.push(a4)
        @stack.push(a5)
        @stack.push(a6)
        @stack.push(a7)
        @stack.push(a8)
        @stack.push(a9)
        expect(@stack.push(a10)).to be true
        expect(@stack.push(a11)).to be false
        expect(@stack.current_size).to eq 10
        expect(@stack.list).to include(a1, a2, a3)
      end

      it "stack can pop object" do
        expect(@stack.current_size).to eq 10
        expect(@stack.pop).to eq ["object10"]
        expect(@stack.current_size).to eq 9
        expect(@stack.pop(2)).to eq(["object8", "object9"])
        expect(@stack.current_size).to eq 7
        expect(@stack.pop(8)).to eq false
        expect(@stack.current_size).to eq 7
        expect(@stack.pop(7)).not_to eq false
        expect(@stack.current_size).to eq 0
      end


    end

  end



end