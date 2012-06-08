class Relationship < ActiveRecord::Base
  belongs_to :sender, :polymorphic => true
  belongs_to :receiver, :polymorphic => true
  attr_accessible :status, :sender, :receiver
end
