class Revenue < ActiveRecord::Base
   attr_accessible :value, :date
   belongs_to :company
   validates :date,:value , :presence => true
end
