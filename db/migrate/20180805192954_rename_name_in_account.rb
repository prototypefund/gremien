class RenameNameInAccount < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :name, :email
  end
end
