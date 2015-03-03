class RemoveGenresFromMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :genres, :string
  end
end
