class CreateExports < ActiveRecord::Migration[5.1]
  def change
    create_table :exports do |t|
      t.string :token
      t.references :account, foreign_key: true
      t.references :procedure, foreign_key: true
      t.text :settings

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
