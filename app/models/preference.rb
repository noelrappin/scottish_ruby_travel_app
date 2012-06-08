class Preference < ActiveRecord::Base
  belongs_to :preferrer
  attr_accessible :key, :value
end
