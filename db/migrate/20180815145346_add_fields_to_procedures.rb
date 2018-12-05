class AddFieldsToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :last_change_at, :datetime
    add_column :procedures, :current_status, :string
    add_column :procedures, :proc_type, :string
    add_column :procedures, :abstract, :text
  end
end
