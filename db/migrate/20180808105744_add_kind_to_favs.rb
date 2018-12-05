class AddKindToFavs < ActiveRecord::Migration[5.1]
  def change
    add_column :favs, :kind, :string, default: 'up', null: false
  end
end
