class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster
      t.integer :year
      t.string :duration
      t.string :imdb_rating

      t.timestamps null: false
    end
  end
end
