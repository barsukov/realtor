class Price < ActiveRecord::Base
   attr_accessible :current_price
   has_attached_file :current_price,
                     :path => ":rails_root/public/system/:attachment/:id/:filename",
                     :url => "/system/:attachment/:id/:filename"
end
