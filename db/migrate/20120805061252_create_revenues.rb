class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.integer :value , :default => 0
      t.datetime :date
      t.timestamps
    end
  end
end
