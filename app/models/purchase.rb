class Purchase < ActiveRecord::Base
  include Services::LineItemAggregator
  belongs_to :buyer, :polymorphic => true
  belongs_to :purchasable, :polymorphic => true
  has_many :purchase_extras
  attr_accessor :lodging
  attr_accessible :amount, :length_of_stay, :purchase_date, :real_travel_date,
      :buyer, :purchasable
end
