class CreateCooperativeFranchises < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperative_franchises do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.references :franchisee, polymorphic: true#, null: false
      t.references :product#, null: false, foreign_key: true
      t.string :status
      t.references :creator, polymorphic: true#, null: false
      t.date :expiry

      t.timestamps
    end
  end
end
