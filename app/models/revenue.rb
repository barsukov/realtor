class Revenue < ActiveRecord::Base
   attr_accessible :value, :date ,:company_id
   belongs_to :company, :inverse_of => :revenues
   validates :date,:value ,:company, :presence => true
   validates :value, :numericality => { :only_integer => true, :greater_than => 0 }


   scope :by_company, lambda{|company_id| where(:company_id => company_id)}

   scope :get_company_last_year_revenues , lambda{|company_id,date| by_company(company_id).where(:date => 1.year.ago .. date)}

   def self.get_all_values_sum(date)
     sum(:value,:conditions => {:date => 1.year.ago .. date})
   end

   def self.get_company_values_sum(company_id,date)
     sum(:value,:conditions => {:company_id => company_id,:date => 1.year.ago .. date})
   end
end
