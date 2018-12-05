class AddSettingsToVisitor < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :settings, :text
  end
end
