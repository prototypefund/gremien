class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :token
      t.string :status
      t.string :email

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
