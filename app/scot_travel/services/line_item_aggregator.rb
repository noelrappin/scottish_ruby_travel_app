module Services
  module LineItemAggregator
    
    def total_price
      purchase_extras.map(&:extended_price).inject(:+)
    end

  end
end
