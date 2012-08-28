class AddPriceDate < ActiveRecord::Migration
  def up
    add_column :prices, :date, :date
  end

  def down
    remove_column :prices, :date
  end
end
