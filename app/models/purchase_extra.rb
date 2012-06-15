class PurchaseExtra < ActiveRecord::Base
  include Services::ExtendedPriceCalculator
  belongs_to :purchase
  belongs_to :extra, :polymorphic => true
  attr_accessible :extra, :unit_count, :unit_price, :purchase
end
