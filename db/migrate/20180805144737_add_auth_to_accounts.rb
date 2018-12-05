class AddAuthToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :auth_token, :string
    add_column :accounts, :auth_sent_at, :datetime
  end
end
