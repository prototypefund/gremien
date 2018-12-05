class AddAuthTokenToVisitor < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :auth_token, :string
    add_column :visitors, :auth_created_at, :datetime
  end
end
