class MainController < ApplicationController

  def index
    @companies = Company.all
    @companies = @companies.sort_by { |h| h.percent}.reverse!
    @static_content = StaticContent.first
    @under_table_text = UnderTableText.all
#    @company =  Company.find_by_user_id(current_user)
    @price = Price.last
    respond_to do |format|
      format.html
    end
  end
end
