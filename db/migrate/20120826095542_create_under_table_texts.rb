class CreateUnderTableTexts < ActiveRecord::Migration
  def change
    create_table :under_table_texts do |t|
      t.text :under_text
      t.timestamps
    end
  end
end
