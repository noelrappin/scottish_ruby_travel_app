require 'fast_spec_helper'
require_number_modules
require 'scot_travel/presenters/trip_presenter' 
require 'scot_travel/services/date_range_service'

module Presenters
  
  class DumbTrip < OpenStruct
    include Services::DateRangeService
  end

  describe TripPresenter do
    it "presents trips" do
      TripPresenter.present_trips([DumbTrip, DumbTrip]).map(&:class)
          .should == [TripPresenter, TripPresenter]
    end

    describe "with one presenter" do
      it "prints a date span" do 
        trip = DumbTrip.new(
            :start_date => Date.parse("January 22, 1971"), 
            :end_date => Date.parse("May 31, 1971"))
        presenter = TripPresenter.new(trip)
        presenter.date_span.should == "January 22, 1971 - May 31, 1971"
      end

      it "prints a blank date span" do
        trip = DumbTrip.new(:start_date => nil, :end_date => nil)
        presenter = TripPresenter.new(trip)
        presenter.date_span.should be_blank
      end
    end

  end
end