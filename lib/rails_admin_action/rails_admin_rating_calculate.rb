# encoding: utf-8
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
          'icon-refresh'
        end

        # Is the action on a model scope (Example: /admin/team/export)
        register_instance_option :collection? do
          true
        end

        # Is the action on an object scope (Example: /admin/team/1/edit)
        register_instance_option :member? do
          false
        end
        register_instance_option :root? do
          false
        end
        register_instance_option :controller do
          Proc.new do
            @abstract_model.model.reset_rating
            flash[:success] = "Рейтинг был успешно обновлен"
            @companies =  @abstract_model.model.ordered_by_place
          end
        end
      end
    end
  end
end