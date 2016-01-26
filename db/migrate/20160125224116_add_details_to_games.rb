class AddDetailsToGames < ActiveRecord::Migration
  def change
    add_column :games, :min_players, :integer, null: false
    add_column :games, :max_players, :integer, null: false
    add_column :games, :playing_time, :integer, null: false
    add_column :games, :thumbnail_url, :string, null: false
    add_column :games, :api_id, :integer, null: false
    remove_column :games, :players, :integer
  end
end
