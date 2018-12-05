class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :token
      t.string :status
      t.string :kind
      t.references :entity, polymorphic: true
      t.references :visitor, foreign_key: true
      t.boolean :option1
      t.boolean :option2
      t.boolean :option3
      
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
