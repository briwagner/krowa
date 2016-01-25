class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user
      t.references :game

      t.timestamps null: false
    end
  end
end
