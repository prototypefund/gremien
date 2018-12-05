class CreateBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :bodies do |t|
      t.string :token
      t.string :status
      t.string :name
      t.text :description
      t.string :url
      t.references :owner, foreign_key: { to_table: :accounts }

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
