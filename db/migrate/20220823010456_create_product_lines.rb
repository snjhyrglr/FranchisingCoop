class CreateProductLines < ActiveRecord::Migration[7.0]
  def change
    create_table :product_lines do |t|
      t.string :name
      t.string :code
      t.boolean :active

      t.timestamps
    end
  end
end
