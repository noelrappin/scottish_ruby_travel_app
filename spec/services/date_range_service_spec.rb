require 'fast_spec_helper'
require 'scot_travel/services/date_range_service'

module Services
  class DummyDateRange < OpenStruct
    include DateRangeService
  end  
  
  describe DateRangeService do
    it "knows when dates aren't missing" do
      DummyDateRange.new(:start_date => Time.now, :end_date => Time.now)
          .should_not be_missing_dates 
    end

    it "knows when dates are missing" do
      DummyDateRange.new(:start_date => nil, :end_date => nil)
          .should be_missing_dates
    end

    it "calculates length" do
      DummyDateRange.new(:start_date => Date.today, :end_date => Date.today + 1).days_long.should == 1
      DummyDateRange.new(:start_date => Date.today, :end_date => Date.today + 2).date_range.should == (1 .. 2)
      DummyDateRange.new(:start_date => Date.today, :end_date => Date.today + 2).length_array.should == [1, 2]
    end
  end
end