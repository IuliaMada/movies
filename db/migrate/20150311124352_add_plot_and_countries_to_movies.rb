class AddPlotAndCountriesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :plot, :string
    add_column :movies, :countries, :string
  end
end
