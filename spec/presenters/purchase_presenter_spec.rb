require 'fast_spec_helper'
require 'delegate'
require_number_modules
require 'scot_travel/presenters/purchase_presenter'
require 'scot_travel/roles/buyer'

module Presenters
  describe PurchasePresenter do
    let(:presenter) { PurchasePresenter.new(purchase) }
    let(:purchase) { OpenActiveModel.new(
        :buyer => user, :purchase_extras => [pe_hotel, pe_tour], 
        :total_price => 1500) }
    let(:user) { OpenActiveModel.new(:first_name => "Fred", :last_name => "Flintstone") }
    let(:hotel) { OpenActiveModel.new(:name => "Hilton") }
    let(:extra) { OpenActiveModel.new(:name => "Tour") }
    let(:pe_hotel) { OpenActiveModel.new(:extra => hotel, :extra_type => "Hotel",
        :unit_price => 400, :unit_count => 3, :extended_price => 1200)}
    let(:pe_tour) { OpenActiveModel.new(:extra => extra, :extra_type => "Tour",
        :unit_price => 300, :unit_count => 1, :extended_price => 300)}
    
    it "presents data" do
      presenter.buyer_name.should == "Fred Flintstone"  
      presenter.hotel_name.should == "Hilton"
      presenter.hotel_price.should == "$1,200.00"
      presenter.hotel_price_display.should == "3 nights at $400.00 = $1,200.00"
      presenter.extras_display.should == ["Tour ($300.00)"]
      presenter.total_price_display.should == "$1,500.00"
    end
  end
end