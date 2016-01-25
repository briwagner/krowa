class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.attachment :image
      t.integer :players
      t.string :description

      t.timestamps null: false
    end
  end
end
