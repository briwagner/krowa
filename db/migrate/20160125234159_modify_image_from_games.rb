class ModifyImageFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :image_file_name, :string
    remove_column :games, :image_content_type, :string
    remove_column :games, :image_file_size, :integer
    remove_column :games, :image_updated_at, :datetime
    add_column :games, :image_url, :string
  end
end
