require 'active_record_spec_helper'
require_number_modules
require 'scot_travel/services/date_range_service'
require 'models/trip'
require 'scot_travel/presenters/trip_presenter' 

module Presenters

  describe TripPresenter do
    it "presents trips" do
      TripPresenter.present_trips([Trip, Trip]).map(&:class)
          .should == [TripPresenter, TripPresenter]
    end

    describe "with one presenter" do
      it "prints a date span" do 
        trip = Trip.new(
            :start_date => Date.parse("January 22, 1971"), 
            :end_date => Date.parse("May 31, 1971"))
        presenter = TripPresenter.new(trip)
        presenter.date_span.should == "January 22, 1971 - May 31, 1971"
      end

      it "prints a blank date span" do
        trip = Trip.new(:start_date => nil, :end_date => nil)
        presenter = TripPresenter.new(trip)
        presenter.date_span.should be_blank
      end

      it "displays a price" do
        presenter = TripPresenter.new(DumbTrip.new(:price => 100.5))
        presenter.price_display.should == "$100.50"
      end
    end

  end
end