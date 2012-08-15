class MainController < ApplicationController

  def index
    @companies = Company.all
    @company =  Company.find_by_user_id(current_user)
    @price = Price.last
    respond_to do |format|
      format.html
    end
  end
end
