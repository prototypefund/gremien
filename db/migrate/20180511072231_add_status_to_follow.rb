class AddStatusToFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :status, :string
  end
end
