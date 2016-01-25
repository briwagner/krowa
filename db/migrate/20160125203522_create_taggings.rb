class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.reference :tag
      t.reference :game

      t.timestamps null: false
    end
  end
end
