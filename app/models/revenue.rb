class Revenue < ActiveRecord::Base
   attr_accessible :value, :date ,:company_id
   belongs_to :company
   validates :date,:value , :presence => true
end
