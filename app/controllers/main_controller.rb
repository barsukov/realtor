class MainController < ApplicationController

  def index
    @companies = Company.all

    respond_to do |format|
      format.html
    end
  end
end
