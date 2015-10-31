require 'spec_helper'

describe Mars do 
	context "create areas" do
		it 'should only accept positive integers' do
      		expect {Mars.new(-4,4).grid}.to raise_error
      		expect {Mars.new(-4,0).grid}.to raise_error
  		end
  		it 'should return "[[.]]" when 1,1 is entererd ' do
      		expect {Mars.new(1,1).grid}.should eq '[["."]]'
      		
  		end
	end 	
end

describe Foo do 
  context "create specific areas mars" do
    
    it 'should only accept positive integers' do
          expect {Foo.new(-4,4).bar}.to raise_error
          expect {Foo.new(-4,0).bar}.to raise_error
      end
      
      it 'should return "[[.]]" when 1,1 is entererd ' do
          expect {Foo.new(1,1).bar}.should eq '[["."]]'
          
      end
  end
end