class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :token
      t.string :status
      t.string :kind
      t.string :title
      t.string :file
      t.references :entity, polymorphic: true
      t.references :author, foreign_key: { to_table: :visitors }
      
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
