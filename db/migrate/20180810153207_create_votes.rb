class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :procedure, foreign_key: true
      t.string :ident_scheme
      t.string :area
      t.string :vote
      t.integer :count, default: 0, null: false

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
