class Purchase < ActiveRecord::Base
  belongs_to :buyer, :polymorphic => true
  belongs_to :purchasable, :polymorphic => true
  attr_accessible :amount, :length_of_stay, :purchase_date, :real_travel_date
end
