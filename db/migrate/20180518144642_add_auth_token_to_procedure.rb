class AddAuthTokenToProcedure < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :auth_token, :string
    add_column :procedures, :auth_created_at, :datetime
  end
end
