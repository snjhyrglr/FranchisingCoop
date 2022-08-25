class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.references :region#, null: false, foreign_key: true
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :position
      t.date :hired
      t.string :email
      t.string :contact_no
      t.string :status
      t.boolean :licensed
      t.boolean :active
      t.string :user_name

      t.timestamps
    end
  end
end
