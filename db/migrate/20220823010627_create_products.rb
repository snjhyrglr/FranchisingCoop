class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :product_line, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.string :name
      t.string :code
      t.boolean :active

      t.timestamps
    end
  end
end
