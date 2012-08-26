class CreateStaticContents < ActiveRecord::Migration
  def change
    create_table :static_contents do |t|
      t.text :title_table
      t.timestamps
    end
  end
end
