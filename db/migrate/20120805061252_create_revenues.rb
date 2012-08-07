class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.integer :value , :default => 0
      t.date :date
      t.timestamps
    end
  end
end
