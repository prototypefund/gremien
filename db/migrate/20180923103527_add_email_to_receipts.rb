class AddEmailToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :email, :string
  end
end
