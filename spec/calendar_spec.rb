require 'spec_helper'
 
describe Calendar do
	before :each do
	    @calendar = Calendar.new
	end

	it "starts at day 0" do
		expect(@calendar.day).to be 0
	end

	describe '#update!' do
		it "increases the day count by speed at each update" do 
			@calendar.set_speed(1)
			expect{@calendar.update!}.to change{@calendar.day}.by 1
		end
	end

	describe '#increase_speed!' do
		it 'increases the speed' do
			expect{@calendar.increase_speed!}.to change{@calendar.speed}.by @calendar.speed*0.5
		end
	end

	describe '#decrease_speed!' do
		it 'decreases the speed' do
			expect{@calendar.decrease_speed!}.to change{@calendar.speed}.by @calendar.speed* -0.5
		end
	end

	describe '#season_count' do
		it 'increases every 90 days' do 
			@calendar.set_speed(89)
			@calendar.update!
			expect(@calendar.season_count).to be 0
			@calendar.set_speed(1)
			@calendar.update!
			expect(@calendar.season_count).to be 1
		end
	end

	describe '#season' do
		it 'should cycle through the seasons of the year' do
			expect(@calendar.season).to be Calendar::SPRING
			@calendar.set_speed(90)
			@calendar.update!
			expect(@calendar.season).to be Calendar::SUMMER
			@calendar.update!
			expect(@calendar.season).to be Calendar::FALL
			@calendar.update!
			expect(@calendar.season).to be Calendar::WINTER
			@calendar.update!
			expect(@calendar.season).to be Calendar::SPRING
		end
	end
end