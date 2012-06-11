class Trip < ActiveRecord::Base
  include Services::DateRangeService
  attr_accessible :activity, :description, :end_date, :image_name, :location, :name, :price, :slug, :start_date, :tag_line
end
