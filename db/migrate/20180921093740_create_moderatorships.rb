class CreateModeratorships < ActiveRecord::Migration[5.1]
  def change
    create_table :moderatorships do |t|
      t.references :procedure, foreign_key: true
      t.references :moderator, foreign_key: { to_table: :visitors }

      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
  
  
end
