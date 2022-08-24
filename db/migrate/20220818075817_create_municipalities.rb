class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.references :region, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.string :name
      t.string :psgc_code

      t.timestamps
    end
  end
end
