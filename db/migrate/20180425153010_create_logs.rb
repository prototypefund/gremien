class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :ip
      t.references :actor, polymorphic: true
      t.string :action
      t.text :comment
      t.references :entity, polymorphic: true
      t.string :user_agent
      
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
