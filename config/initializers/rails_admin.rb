# RailsAdmin config file. Generated on July 30, 2012 23:10
# See github.com/sferik/rails_admin for more informations
module RailsAdmin
  module Config
    module Actions
      class RatingCalculate < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :root do
          true
        end
      end
    end
  end
end

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
   require 'i18n'

   I18n.default_locale = :ru
  config.current_user_method { current_admin } # auto-generated


  # If you want to track changes on your models:
  # config.audit_with :history, Admin

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Admin

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Rails Admin', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.rails_admin.engine_name.titleize, controller.params['action'].titleize] }

  config.authorize_with :cancan ,AdminAbility
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  #Add all excluded models here:
  config.excluded_models = [Admin]

  # Add models here if you want to go 'whitelist mode':
   config.included_models = [User,Company,Revenue,Price,StaticContent,UnderTableText]



   config.actions do
     dashboard
     rating_calculate do
       i18n_key :dash
     end
     index
     new
     show
     edit
     delete
   end
  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
   config.model StaticContent do
     navigation_label I18n.t('common.static_content')
     label_plural I18n.t('static_content.static_content')
     label I18n.t('static_content.static_content')
     configure :title_table do
       label(I18n.t('static_content.title'))
       ckeditor true
       filterable false
     end
     list do
       field :title_table
     end
     weight -1
   end

   config.model UnderTableText do
     navigation_label  I18n.t('common.static_content')
     label I18n.t('static_content.text_under_table')
     label_plural I18n.t('static_content.text_under_table')
     configure :under_text do
       label(I18n.t('static_content.text_under_table'))
       ckeditor true
       filterable false
     end
     list do
       field :under_text
     end
     weight -1
   end

   config.model Price do
     label I18n.t('prices.price')
     configure :current_price do
       label(I18n.t('prices.current_price'))
       filterable false
     end
     configure :date do
       label(I18n.t('common.date'))
       filterable false
     end
     list do
       field :current_price
       field :date
     end
     label_plural I18n.t('prices.price')
   end

  config.model Revenue do
    label I18n.t('revenue.revenue')
    label_plural I18n.t('revenue.revenues')
    configure :date do
      label(I18n.t('common.date'))
      strftime_format  "%Y-%m-%d"
      filterable false
    end
    configure :value do
      label(I18n.t('common.value'))
      filterable false
    end
    configure :company do
      label I18n.t('company.name')
      filterable false
    end
    list do
      field :date
      field :value
      field :company
    end
    create do
      field :date
      field :value , :integer
      field :company
    end
    edit do
      field :value, :integer
      field :date
      field :company
    end
  end

   config.model Company do
    label I18n.t('company.singular')
    label_plural I18n.t('company.plural')
    configure :name do
      label I18n.t('company.name')
      filterable false
    end
    configure :revenues do
      orderable false
    end
     list do
       field :name
     end
    create do
      field :revenues
      field :name
    end
    edit do
      field :revenues
      field :name
    end
     end


   config.model User do
     label I18n.t('user.singular')
     label_plural I18n.t('user.plural')
     configure :email do
       label I18n.t('user.email')
     end
     configure :password do
       label I18n.t('user.password')
     end
     configure :last_sign_in_at do
       label(I18n.t('user.last_sighn_in'))
       strftime_format  "%Y-%m-%d"
       filterable false
     end
     list do
       field :email
       field :last_sign_in_at do
       end
     end
    create do
      field :email
      field :password, :password
      field :password_confirmation , :password
    end
     edit do
         field :email
         field :password, :password
         field :password_confirmation , :password
     end
   end
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Admin do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer
  #     configure :email, :string
  #     configure :password, :password         # Hidden
  #     configure :password_confirmation, :password         # Hidden
  #     configure :reset_password_token, :string         # Hidden
  #     configure :reset_password_sent_at, :datetime
  #     configure :remember_created_at, :datetime
  #     configure :sign_in_count, :integer
  #     configure :current_sign_in_at, :datetime
  #     configure :last_sign_in_at, :datetime
  #     configure :current_sign_in_ip, :string
  #     configure :last_sign_in_ip, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
