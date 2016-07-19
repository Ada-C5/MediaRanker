class RenameVotesTopicIdToMovieId < ActiveRecord::Migration
  def change
      rename_column :votes, :topic_id, :movie_id
  end
end
