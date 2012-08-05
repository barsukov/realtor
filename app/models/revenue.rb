class Revenue < ActiveRecord::Base
   attr_accessible :value, :date
  validates :date,:value , :presence => true
end
