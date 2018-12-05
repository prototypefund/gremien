class AddVoteInfoToProcedures < ActiveRecord::Migration[5.1]
  def change
    rename_column :procedures, :voteDate_at, :vote_date_at
    
    add_column :procedures, :vote_end_at, :datetime
    add_column :procedures, :edit_delay, :integer
    add_column :procedures, :required_votes, :integer
    add_column :procedures, :language, :string
  end
end
