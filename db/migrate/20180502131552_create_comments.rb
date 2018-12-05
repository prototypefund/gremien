class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :token
      t.string :status
      t.references :argument, foreign_key: true
      t.text :content
      t.references :author, foreign_key: { to_table: :visitors}

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
