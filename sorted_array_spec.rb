require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
          # pending "fill this spec in with a meaningful example"

          sorted_array.map { |el| el * 3 }.should eq [6,9,12,21,27]

        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
          # pending "fill this spec in with a meaningful example"
       
          original_array = sorted_array.internal_arr
          # sorted_array.map! {|el| el * 2 }.should eq original_array
          # sorted_array.internal_arr.should eq [4,6,8,14,18]

          # expect { sorted_array.map! {|el| el } }.to change { original_array }

        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          # pending "this is just the same as the example above"

           sorted_array.map! { |el| el * 3 }.should eq [6,9,12,21,27]

        end
      end
    end
  end

  describe :find do
    # INVALID it_should_behave_like "yield to all elements in sorted array", :find

    it "takes the values returned by the block and finds the first instance in the array" do
      # pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-find"
    
      sorted_array.find { |el| el == 3 }.should eq 3

    end
  end

  describe :inject do
    # INVALID it_should_behave_like "yield to all elements in sorted array", :inject
    # .inject passes 2 arguments to the block, not 1

    # specify do
    #   expect do |b|
    #     block_with_two_args = Proc.new { |acc, el| return true }
    #     sorted_array.send(method, block_with_two_args)
    #   end.to yield_successive_args([0,2], [2,3], [5,4], [9,7], [16,9])
    # end



    it "does not currently have any examples for it" do
      pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject"
    end
  end
end
