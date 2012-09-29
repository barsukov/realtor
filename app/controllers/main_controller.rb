class MainController < ApplicationController

  def index
    @companies = Company.ordered_by_place
    @static_content = StaticContent.first
    @under_table_text = UnderTableText.all
#    @company =  Company.find_by_user_id(current_user)
    @price = Price.last
    #@price_date = @price.date.strftime('%Y.%m.%d') unless @price.nil?
    respond_to do |format|
      format.html
    end
  end
end
