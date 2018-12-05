class AddCommentToRating < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :comment, :string, limit: 500
  end
end
