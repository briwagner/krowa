class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :game
      t.integer :reviewer_id
      t.integer :rating
      t.string :description

      t.timestamps null: false
    end
  end
end
