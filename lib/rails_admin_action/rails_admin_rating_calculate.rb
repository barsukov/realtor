require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminRatingCalculate
end

module RailsAdmin
  module Config
    module Actions
      class RatingCalculate < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :visible? do
          authorized?
        end
        register_instance_option :link_icon do
          'icon-question-sign'
        end

        # Is the action on a model scope (Example: /admin/team/export)
        register_instance_option :collection? do
          false
        end

        # Is the action on an object scope (Example: /admin/team/1/edit)
        register_instance_option :member? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @companies = Company.all
            @companies = @companies.sort_by { |h| h.percent}.reverse!
            @companies.each_with_index  do |company,index|
              current_index =  index + 1
              unless (current_index == company.current_place)
                company.last_place = company.current_place
                company.current_place = current_index
              end
              company.save
            end
            flash[:notice] = "Рейтинг был успешно обновлен "

            redirect_to back_or_index
          end
        end
      end
    end
  end
end