require 'fast_spec_helper'
require 'scot_travel/roles/buyer'

module Roles
  describe Buyer do 
    let(:user) { OpenActiveModel.new(:purchases => OpenActiveAssociation.new) }
    let(:purchased) { OpenActiveModel.new(:name => "Purchased", :id => 3) }
    let(:unpurchased) { OpenActiveModel.new(:name => "Unpurchased") }

    it "knows what it has purchased" do
      user.extend(Buyer)
      user.purchase(purchased, {}, OpenActiveModel)
      user.should have_purchased(purchased)
      user.should_not have_purchased(unpurchased)  
    end
  end
end
