class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.references :procedure, foreign_key: true
      t.datetime :deal_at
      t.string :action
      t.string :location
      t.string :url

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
