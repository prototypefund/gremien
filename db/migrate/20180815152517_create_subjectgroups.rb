class CreateSubjectgroups < ActiveRecord::Migration[5.1]
  def change
    create_table :subjectgroups do |t|
      t.string :title
      t.references :owner, foreign_key: { to_table: :accounts }

      t.timestamps
    end
    
    create_join_table :procedures, :subjectgroups do |t|
      t.index :procedure_id
      t.index :subjectgroup_id
    end
  end
end
