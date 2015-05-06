require 'spec_helper'
 
describe Tree do

	it "has an initial x and y location" do
		@tree = Tree.new(10,10)
		expect(@tree.x).to be 10
		expect(@tree.y).to be 10
	end

	it "ages with each update" do 
		@tree = Tree.new(10,10)
		@calendar = Calendar.new
		expect { @tree.update!(@calendar) }.to change{@tree.age}.by(@calendar.speed)
	end

end