class CreateCooperatives < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.references :region#, null: false, foreign_key: true
      t.references :province#, null: false, foreign_key: true
      t.references :municipality#, null: false, foreign_key: true
      t.references :barangay#, null: false, foreign_key: true
      t.string :address
      t.string :category
      t.string :coop_type
      t.string :status
      t.string :asset_size
      t.string :registration_no
      t.decimal :total_asset, precision: 20, scale: 2

      t.timestamps
    end
  end
end
