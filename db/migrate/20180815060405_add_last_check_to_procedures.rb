class AddLastCheckToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :last_check_at, :datetime
  end
end
