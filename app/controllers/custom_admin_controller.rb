  class CustomAdminController < RailsAdmin::MainController
    def reset
    Company.reset_rating
    @companies =  Company.ordered_by_place
     respond_to do |format|
      format.js {render :partial => "rails_admin/main/company_rating"}
     end
    end
  end

