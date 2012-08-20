class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :company   , :dependent => :destroy , :inverse_of => :user
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:company_id
  accepts_nested_attributes_for :company , :allow_destroy => true

  def company_id
    self.company.try :id
  end
  def company_id(id)
    self.company = Company.find_by_id(id)
  end
  # attr_accessible :title, :body
end
