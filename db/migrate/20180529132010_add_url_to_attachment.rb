class AddUrlToAttachment < ActiveRecord::Migration[5.1]
  def change
    add_column :attachments, :url, :string
  end
end
