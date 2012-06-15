require 'active_record_spec_helper'
require 'scot_travel/contexts/purchase_trip_context'
require 'scot_travel/roles/buyer'
require 'scot_travel/services/date_range_service'
require 'models/purchase'
require 'models/trip'
require 'models/hotel'
require 'models/extra'
require 'models/purchase_extra'

module Contexts

  describe PurchaseTripContext do 
    let(:current_user) { OpenActiveModel.new(:id => 3, 
        :purchases => OpenActiveAssociation.new) }
    let(:params) { {:length_of_stay => 4, :lodging => 5, 
        :extras => [1, 4], :purchasable_id => 3} }

    it "creates a new purchase given the parameters" do
      Trip.should_receive(:find).with(3).and_return(Trip.new(:name => "Trip"))
      Extra.should_receive(:find).twice.and_return(Extra.new)
      Hotel.should_receive(:find).with(5).and_return(Hotel.new)
      new_purchase = PurchaseTripContext.new(params, current_user).call
      new_purchase.buyer.should == current_user
      new_purchase.purchasable.name.should == "Trip"
      new_purchase.length_of_stay.should == 4
      new_purchase.should have(3).purchase_extras
      new_purchase.purchase_extras.map { |pe| pe.extra.class }
          .should == [Extra, Extra, Hotel]
      new_purchase.buyer.purchases.data.should == [new_purchase]
    end
  end
end