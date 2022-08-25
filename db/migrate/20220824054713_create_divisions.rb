class CreateDivisions < ActiveRecord::Migration[7.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :short_name
      t.boolean :active

      t.timestamps
    end
  end
end
