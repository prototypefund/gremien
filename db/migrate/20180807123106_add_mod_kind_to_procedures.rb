class AddModKindToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :mod_kind, :string
  end
end
