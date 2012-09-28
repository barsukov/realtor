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
            report = "#{@object.class.to_s.demodulize}Report".constantize.new
            send_data report.to_pdf(@object), :filename => "#{@object.class.to_s.demodulize}_#{@object.id}.pdf", :type => "application/pdf"
          end
        end
         register_instance_option :link_icon do
          'icon-home'
        end
      end
    end
  end
end