class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.references :division, null: false, foreign_key: true
      t.string :name
      t.string :short_name
      t.boolean :active

      t.timestamps
    end
  end
end
