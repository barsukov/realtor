class Revenue < ActiveRecord::Base
   attr_accessible :value, :date ,:company_id
   belongs_to :company
   validates :date,:value ,:company_id, :presence => true
   validates :value, :numericality => { :only_integer => true, :greater_than => 0 }
end
