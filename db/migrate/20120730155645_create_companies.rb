class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.name
      t.timestamps
    end
  end
end
