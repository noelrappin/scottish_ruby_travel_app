require 'fast_spec_helper'
require 'scot_travel/services/line_item_aggregator'

module Services

  class Order < OpenStruct
    include LineItemAggregator
  end

  describe LineItemAggregator do
    let(:li1) { OpenStruct.new(:extended_price => 500) }
    let(:li2) { OpenStruct.new(:extended_price => 200) }
    let(:li3) { OpenStruct.new(:extended_price => 400) }

    it "calculates the total price" do
      order = Order.new(:purchase_extras => [li1, li2, li3])
      order.total_price.should == 1100  
    end
  end
end