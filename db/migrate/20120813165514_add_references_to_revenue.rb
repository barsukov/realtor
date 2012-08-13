class AddReferencesToRevenue < ActiveRecord::Migration
  def change
    change_table :revenues do |t|
      t.references :company
    end
  end
end
