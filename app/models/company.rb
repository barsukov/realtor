class Company < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :revenues

  attr_accessible :revenues_attributes, :allow_destroy => true

  accepts_nested_attributes_for :revenues, :allow_destroy => true

  attr_accessible :revenue_ids,:user_id

  #scope :get_all_revenue_values, where(Revenue.arel_table[:company_id].eq(arel_table[:id]).and.Revenue.arel_table[:updated_at].gteq(1.year.ago))

  #scope :get_all_values_by_date, lambda {|date|  joins(:revenues).where('revenues.company_id = ? AND revenues.updated_at = ?', self.id , date)}

  def percent
  sum = Revenue.get_all_values_sum(Time.now)
  current_value = Revenue.get_company_values_sum(self.id,Time.now)
    current_value.percent_of(sum)
  end
end

class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end
