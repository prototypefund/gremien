class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :password_digest
      
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
