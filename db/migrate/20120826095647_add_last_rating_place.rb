class AddLastRatingPlace < ActiveRecord::Migration
  def up
    add_column :companies, :last_place, :integer
    add_column :companies, :current_place , :integer
  end

  def down
    remove_column :companies, :last_place
    remove_column :companies, :current_place
  end
end
