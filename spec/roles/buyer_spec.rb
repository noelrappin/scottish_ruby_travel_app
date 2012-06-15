require 'fast_spec_helper'
require 'scot_travel/roles/buyer'

module Roles
  describe Buyer do 
    let(:user) { OpenActiveModel.new(:purchases => OpenActiveAssociation.new) }
    let(:purchased) { OpenActiveModel.new(:name => "Purchased", :id => 3) }
    let(:unpurchased) { OpenActiveModel.new(:name => "Unpurchased") }
    let(:extra) { OpenActiveModel.new(:name => "Extra", :id => "2", :price => 200) }

    it "knows what it has purchased" do
      user.extend(Buyer)
      user.purchase(purchased, {}, OpenActiveModel)
      user.should have_purchased(purchased)
      user.should_not have_purchased(unpurchased)  
    end

    it "can amend a purchase" do
      user.extend(Buyer)
      user.purchase(purchased, {}, OpenActiveModel)
      purchase = user.purchases[0]
      purchase.purchase_extras = []
      result = user.add_to_purchase(purchase, extra, 1, OpenActiveModel)
      purchase.purchase_extras.should == [result]  
      result.unit_count.should == 1
      result.unit_price.should == 200
    end
  end
end
