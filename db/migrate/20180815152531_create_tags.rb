class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :key
      t.string :value
      t.references :owner, foreign_key: { to_table: :accounts }

      t.timestamps
    end
    
    create_join_table :procedures, :tags do |t|
      t.index :procedure_id
      t.index :tag_id
    end
  end
end
