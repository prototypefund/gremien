class CreateArguments < ActiveRecord::Migration[5.1]
  def change
    create_table :arguments do |t|
      t.string :token
      t.string :status
      t.string :kind
      t.references :procedure, foreign_key: true
      t.string :title
      t.text :description
      t.references :author, foreign_key: { to_table: :visitors}

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
