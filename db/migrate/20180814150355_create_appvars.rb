class CreateAppvars < ActiveRecord::Migration[5.1]
  def change
    create_table :appvars do |t|
      t.string :key
      t.string :value

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
