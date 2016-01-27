class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group
      t.references :user

      t.timestamps null: false
    end
  end
end