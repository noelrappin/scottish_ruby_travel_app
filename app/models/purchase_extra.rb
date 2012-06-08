class PurchaseExtra < ActiveRecord::Base
  belongs_to :purchase
  attr_accessible :extra, :unit_count, :unit_price
end
