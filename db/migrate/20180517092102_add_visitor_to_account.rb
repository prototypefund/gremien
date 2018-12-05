class AddVisitorToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :status, :string
    add_reference :accounts, :visitor, foreign_key: true
  end
end
