class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :token
      t.string :status
      t.string :kind
      t.references :period, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :submission_at
      t.datetime :voteDate_at
      t.string :url
      t.references :owner, foreign_key: { to_table: :accounts}

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
