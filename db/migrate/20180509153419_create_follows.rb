class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :entity, polymorphic: true
      t.references :author, foreign_key: { to_table: :visitors }

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
