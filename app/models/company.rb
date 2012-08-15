class Company < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :revenues

  attr_accessible :revenues_attributes, :allow_destroy => true

  accepts_nested_attributes_for :revenues, :allow_destroy => true

  attr_accessible :revenue_ids,:user_id

  scope :get_all_values_by_date, lambda {|date|  joins(:revenues).where('revenues.company_id = ? AND revenues.updated_at = ?', self.id , date)}

  def values
    # get_all_values_by_date(Time.now)
  end
end
