class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
      t.boolean :status
      t.references :movie, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_lists, :movies
    add_foreign_key :user_lists, :users
  end
end
