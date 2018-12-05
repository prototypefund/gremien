class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :token
      t.string :status
      t.references :procedure, foreign_key: true
      t.references :visitor, foreign_key: true
      t.string :auth_token
      t.datetime :auth_sent_at
      
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
