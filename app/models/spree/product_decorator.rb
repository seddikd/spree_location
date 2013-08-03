Spree::Product.class_eval do
  has_one :location, :as => :locatable
  accepts_nested_attributes_for :location, :allow_destroy => true
  attr_accessible :location, :location_attributes
end