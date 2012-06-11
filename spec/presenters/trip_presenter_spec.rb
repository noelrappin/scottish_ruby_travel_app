require 'fast_spec_helper'
require 'scot_travel/presenters/trip_presenter'

class DumbTrip < OpenStruct; end 

module Presenters
  describe TripPresenter do
    it "presents trips" do
      TripPresenter.present_trips([DumbTrip, DumbTrip]).map(&:class)
          .should == [TripPresenter, TripPresenter]
    end
  end
end