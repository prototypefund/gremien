class AddIndentSchemeToVisitors < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :ident_scheme, :string
  end
end
