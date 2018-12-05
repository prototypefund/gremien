class AddTokenToFollows < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :token, :string
    add_column :follows, :last_sent_at, :datetime
    add_column :follows, :clicks, :integer
  end
end
