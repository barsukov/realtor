class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.timestamps
      t.has_attached_file :current_price
    end
  end
end
