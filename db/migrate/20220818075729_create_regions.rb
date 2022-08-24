class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :psgc_code

      t.timestamps
    end
  end
end
