class Company < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user ,:dependent => :destroy,:inverse_of => :company
  has_many :revenues, :dependent => :destroy,:inverse_of => :company

  attr_accessible :revenues_attributes, :allow_destroy => true

  accepts_nested_attributes_for :revenues, :allow_destroy => true

  attr_accessible :revenue_ids,:user_id

  #scope :get_all_revenue_values, where(Revenue.arel_table[:company_id].eq(arel_table[:id]).and.Revenue.arel_table[:updated_at].gteq(1.year.ago))
   scope :ordered_by_place , order(:current_place)
  #scope :get_all_values_by_date, lambda {|date|  joins(:revenues).where('revenues.company_id = ? AND revenues.updated_at = ?', self.id , date)}


  def percent
  sum = Revenue.get_all_values_sum(Time.now)
  current_value = Revenue.get_company_values_sum(self.id,Time.now)
    current_value.percent_of(sum)
  end
def self.reset_rating
  @companies = Company.all
  @companies = @companies.sort_by { |h| h.percent}.reverse!
  @companies.each_with_index  do |company,index|
    current_index =  index + 1
    company.last_place = company.current_place
    company.current_place = current_index
    #unless (current_index == company.current_place)
    #
    #end
    company.save
  end
end
end
class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end
