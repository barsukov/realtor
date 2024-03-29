class Price < ActiveRecord::Base
   attr_accessible :current_price,:date
   has_attached_file :current_price,
                     :path => ":rails_root/public/system/:attachment/:id/:filename",
                     :url => "/system/:attachment/:id/:filename"
   validates :date,:current_price, :presence => true
   scope :last_price , order(:updated_at).first
end
