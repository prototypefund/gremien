class ChangePeriodIdInProcedures < ActiveRecord::Migration[5.1]
  def change
    remove_reference :procedures, :period, foreign_key: true
    add_reference :procedures, :body, foreign_key: true
  end
end
