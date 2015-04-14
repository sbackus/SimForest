require 'spec_helper'
 
describe Calendar do
	before :each do
	    @calendar = Calendar.new
	end
	it "increases the day count by speed each update" do 
		@calendar.set_speed(1)
		expect{@calendar.update!}.to change{@calendar.day}.by 1
	end
end